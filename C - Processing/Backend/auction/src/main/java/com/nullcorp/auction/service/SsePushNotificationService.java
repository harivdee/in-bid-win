package com.nullcorp.auction.service;

import javax.json.*;
import com.nullcorp.auction.dao.AuctionDao;
import com.nullcorp.auction.entity.Auction;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter.SseEventBuilder;

@Service
@EnableScheduling
public class SsePushNotificationService {

    @Autowired
    AuctionDao adao;
    
    @Autowired
    AuctionService aService;

    final DateFormat DATE_FORMATTER = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
    final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();

    public void addEmitter(final SseEmitter emitter) {
        emitters.add(emitter);
    }

    public void removeEmitter(final SseEmitter emitter) {
        emitters.remove(emitter);
    }

    @Async
    @Scheduled(fixedRate = 3000)
    public void doNotify() throws IOException {
        List<SseEmitter> deadEmitters = new ArrayList<>();
        SseEventBuilder eventBuilder = SseEmitter.event();

        eventBuilder.data(createActiveAuctionJSON().toString());

        emitters.forEach(emitter -> {
            try {
                emitter.send(eventBuilder);
            } catch (Exception e) {
                deadEmitters.add(emitter);
            }
        });
        emitters.removeAll(deadEmitters);
    }

    public JsonArray createActiveAuctionJSON() {
        List<Auction> list = adao.findall();
        Timestamp timestamp_now = new Timestamp(new Date().getTime());

        JsonArrayBuilder jsonArray = Json.createArrayBuilder();
        
        List<Integer> expiredAuctions = new ArrayList();

        for (Auction auction : list) {
            Timestamp timestamp_end = new Timestamp(auction.getEtime().getTime());
            long remainingTime = timestamp_end.getTime() - timestamp_now.getTime();
            if (remainingTime > 0) {
                JsonObject eachdata = Json.createObjectBuilder().add("auction", Json.createObjectBuilder()
                        .add("id", auction.getAuctionid())
                        .add("itemid",auction.getItem().getItemid())
                        .add("title", auction.getItem().getItitle())
                        .add("reserve", auction.getAreserve())
                        .add("remaining_time", remainingTime))
                        .add("location", auction.getItem().getHouse().getHlocation())
                        .add("size", auction.getItem().getHouse().getHsize())
                        .add("bedrooms", auction.getItem().getHouse().getHroom())
                        .add("bathrooms", auction.getItem().getHouse().getHbathroom())
                        .add("heating", auction.getItem().getHouse().getHheating())
                        .add("userid", auction.getItem().getUser().getUserid())
                        .add("username", auction.getItem().getUser().getUsername())
                        .add("furnished", auction.getItem().getHouse().getHfurnished())
                        .build();
                jsonArray.add(eachdata);
            } else {
                expiredAuctions.add(auction.getAuctionid());
            }
        }
        aService.terminateExpiredAuctions(expiredAuctions);
        return jsonArray.build();
    }
}
