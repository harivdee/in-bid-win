jQuery(init);

function init($) {
    const eventSource = new EventSource('http://localhost:8080/notification');
    let auctions = [];
    eventSource.onmessage = e => {
//        const auctions = e.data;
//        console.log(typeof e.data);
        let test = JSON.parse(e.data);
        auctions = test;
//        console.log(auctions);
        const listofauctions = $("#auctions");
        function displayAuctions(random) {
            console.log(random);
            listofauctions.empty();
            $(random).each(function (key, value) {
                console.log(value);
//                auction.push(value);
                const templ = ` <div class="card mb-3 ml-2" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">${value.auction.title}</h5>
                    <h6 class="card-subtitle mb-2 text-muted"> ${value.location} </h6>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div id="price" class="font-weight-bold">Reserve Price: </div>$${value.auction.reserve}</li>
                        <li class="list-group-item">
                            <div id="size" class="font-weight-bold">Size: </div> ${value.size} m<sup>2<sup></li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Furnished: </div> ${value.furnished}</li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Remaining Time: </div> ${msToTime(value.auction.remaining_time)}</li>
                    </ul>
                    <div class="card-footer">
                        <button class="btn btn-primary w-100"><a class="text-white" href="#">View more details</a></button>
                    </div>
                </div>
                </div>`;
                listofauctions.append(templ);
            });

        }

        displayAuctions(auctions);

    };

    const priceSlider = $('#priceRange');

    priceSlider.on('input', (p) => {
        // console.log('on input:' + p.target.value);
        $('#pselected').text('$' + p.target.value);
    });

    priceSlider.on('change', (p) => {
        const filterauc = getFilteredProducts(auctions, p.target.value);
        displayAuctions(filterauc);
    });

    function getFilteredProducts(list, limit) {
        const filterd = list.filter((auction) => {
            return parseFloat(auction.auction.reserve) < limit;
        });
        return filterd;
    }

    $('#sizeA').on('click', function () {
        auctions.sort(function (a, b) {
            if (a.size < b.size)
                return 1;
            if (a.size > b.size)
                return -1;
            return 0;
        });
        displayAuctions(auctions);
    })

    $('#sizeB').on('click', function () {
        auctions.sort(function (a, b) {
            if (a.size < b.size)
                return -1;
            if (a.size > b.size)
                return 1;
            return 0;
        });
        displayAuctions(auctions);
    })


}

function msToTime(s) {

    // Pad to 2 or 3 digits, default is 2
    function pad(n, z) {
        z = z || 2;
        return ('00' + n).slice(-z);
    }

    let ms = s % 1000;
    s = (s - ms) / 1000;
    let secs = s % 60;
    s = (s - secs) / 60;
    let mins = s % 60;
    let hrs = (s - mins) / 60;

    return pad(hrs) + 'hr : ' + pad(mins) + 'min : ' + pad(secs) + 'secs.';
}



