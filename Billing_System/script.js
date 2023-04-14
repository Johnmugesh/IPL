    // Retrieve the session storage data
        var sessionData = window.sessionStorage;
        var cartPRODUCTs = Object.keys(sessionData);

        // Get a reference to the table element
        var table = document.getElementById("TABLE");

        // Create the table header
        var headerRow = table.insertRow();
        var idHeader = headerRow.insertCell(0);
        idHeader.innerHTML = "ID";
        var priceHeader = headerRow.insertCell(1);
        priceHeader.innerHTML = "Price";
        var countHeader = headerRow.insertCell(2);
        countHeader.innerHTML = "Count";

        var ttlPrice = 0;

        // Add the cart PRODUCTs to the table
        for (var i = 0; i < cartPRODUCTs.length; i++) {
        var PRODUCT = JSON.parse(sessionData.getPRODUCT(cartPRODUCTs[i]));
        var row = table.insertRow();
        var idCell = row.insertCell(0);
        idCell.innerHTML = cartPRODUCTs[i];
        var priceCell = row.insertCell(1);
        priceCell.innerHTML = PRODUCT.price;
        var countCell = row.insertCell(2);
        countCell.innerHTML = PRODUCT.count;
        ttlPrice += Number(PRODUCT.price) * Number(PRODUCT.count);
    }

        document.getElementById("TP").innerHTML = `The Total Cart Amount = ${ttlPrice} $`;


        function checkout(){
            alert("Thank you for shopping! Do come back again!");
            sessionStorage.clear();
            window.location.href="home.jsp";
        }

        function change(){

            flag = 0;
            var id = document.getElementById('ID').value;
            var count = document.getElementById('COUNT').value;
            if(isNaN(count) || count < 0)
            {
                alert("Invalid Count Value");
                return;
            }
            for (var i = 0; i < cartPRODUCTs.length; i++) {
                var PRODUCT = JSON.parse(sessionData.getPRODUCT(cartPRODUCTs[i]));
                if(cartPRODUCTs[i] == id)
                {
                    var arr = { price: PRODUCT.price, count: count };
                    window.sessionStorage.setPRODUCT(id, JSON.stringify(arr));
                    flag = 1;
                    alert("Change Made");
                    location.reload();
                }
                if(flag == 0)
                {
                    alert("Check your inputs");
                }
                
            }
        }
        