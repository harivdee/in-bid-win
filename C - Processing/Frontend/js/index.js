jQuery(init);
function init($) {

    // Your web app's Firebase configuration
    const firebaseConfig = {
        apiKey: "AIzaSyDaFqv9C1I9L04NcFQpEfJokqvW5DhCr30",
        authDomain: "in-bid-win.firebaseapp.com",
        databaseURL: "https://in-bid-win.firebaseio.com",
        projectId: "in-bid-win",
        storageBucket: "in-bid-win.appspot.com",
        messagingSenderId: "513651676138",
        appId: "1:513651676138:web:583a499427f09fb1ea9893",
        measurementId: "G-TNXK2DCSN4"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    //GLOBAL
    const apartments = [];
    const cartApts = [];
    const cart_n = $('#cart_n')[0];
    //DIVS
    let listingDiv = $('#listingDiv')[0];
    let accountDiv = $('#accountDiv')[0];
    let aboutDiv = $('#aboutDiv')[0];
    //INFORMATION
    let APARTMENTS = [{ name: 'APT1', price: 1 }, { name: 'APT2', price: 1 }, { name: 'APT3', price: 1 }, { name: 'APT4', price: 2 }];
    let AUCTIONS = [{ name: 'AUCTION1', price: 1 }, { name: 'AUCTION2', price: 1 }, { name: 'AUCTION3', price: 1 }, { name: 'AUCTION4', price: 2 }];
    let BIDS = [{ name: 'BID1', price: 1 }, { name: 'BID2', price: 1 }, { name: 'BID3', price: 1 }, { name: 'BID4', price: 2 }];

    //HTML
    function HTMLlistings(con) {
        let URL = `img/apartments/apartment${con}.jpeg`;
        let btn = `btnApartment${con}`;
        return `
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img class="card-img-top" style="height:16rem;" src="${URL}" alt="Card image cap">
                <div class="card-body">
                    <i style="color:orange;" class="fa fa-star"></i> 
                    <i style="color:orange;" class="fa fa-star"></i> 
                    <i style="color:orange;" class="fa fa-star"></i> 
                    <i style="color:orange;" class="fa fa-star"></i> 
                    <i style="color:orange;" class="fa fa-star"></i>
                    <p class="card-text">${APARTMENTS[con - 1].name}</p> 
                    <p class="card-text">Price: ${APARTMENTS[con - 1].price}.00</p>
                    <div class="d-flex justify-content-center-between align-items-center">
                        <div class="btn-group">
                            <button type="button" onclick="cart2('${APARTMENTS[con-1].name}','${APARTMENTS[con-1].price}','${URL}','${con}','${btn}')"
                            class="btn btn-sm btn-outline-secondary">
                                Bid
                            </button>
                            <button id="${btn}" type="button" onclick="cart('${APARTMENTS[con-1].name}','${APARTMENTS[con-1].price}','${URL}','${con}','${btn}')"
                            class="btn btn-sm btn-outline-secondary">
                                Add to cart
                            </button>
                        </div>
                        <small class="text-muted"> Free Tour </small>
                    </div> 
                </div>
            </div>
        </div>
      `
    }
    //ANIMATION
    function animation() {
        
    }

    //CART FUNCTIONS 
    function cart(name,price,url,con,btncart) {
        let item= {
            name:name,
            price:price,
            url:`${url}`
        }
        cartApts.push(item);
        let storage = JSON.parse(localStorage.getItem("cart"));
        if(storage==null) {
            apartments.push(item);
            localStorage.setItem("cart",JSON.stringify(products));
        } else {
            apartments = JSON.parse(localStorage.getItem("cart"));
            cart_n.innerHTML = `[${apartments.length}]`;
            $('#btncart').hide();
        }
    }

    //RENDER
    function render() {
       for(let index= 1; index< 6; index++) {
           listingDiv.innerHTML+= `${HTMLlistings(index)}`;
       }
       if(localStorage.getItem("cart")==null) {

       } else {
           
       }
       
    }



}