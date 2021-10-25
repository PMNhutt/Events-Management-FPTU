// selecting required element
const elem = document.querySelector(".pagination ul");
let totalPages = "${sessionScope.endPagePost}";

//get url from current page
function parse_query_string(query) {
    var vars = query.split("&");
    var query_string = {};
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        var key = decodeURIComponent(pair[0]);
        var value = decodeURIComponent(pair[1]);
        // If first entry with this name
        if (typeof query_string[key] === "undefined") {
            query_string[key] = decodeURIComponent(value);
            // If second entry with this name
        } else if (typeof query_string[key] === "string") {
            var arr = [query_string[key], decodeURIComponent(value)];
            query_string[key] = arr;
            // If third or later entry with this name
        } else {
            query_string[key].push(decodeURIComponent(value));
        }
    }
    return query_string;
}

var query = window.location.search.substring(1);
var qs = parse_query_string(query);
//page = url index
let page = parseInt(qs.index);

//calling function with passing parameters and adding inside element which is ul tag
elem.innerHTML = createPagination(totalPages, page);
function createPagination(totalPages, page) {
    let liTag = '';
    let active;
    let beforePage = page - 1;
    let afterPage = page + 1;
    if (page > 1) { //show the next button if the page value is greater than 1
        liTag += `<li class="btn prev" onclick="createPagination(totalPages,` + (page - 1) + `)"><span><a href="ViewPostController?index=` + (page - 1) + `&search=` + "${Search}" + `"><i class="fas fa-angle-left"></i></a> </span></li>`;
    }

    if (page > 2) { //if page value is less than 2 then add 1 after the previous button
        liTag += `<li class="first numb" onclick="createPagination(totalPages, 1)"><span><a href="ViewPostController?index=1&search=` + "${Search}" + `">1</a></span></li>`;
        if (page > 3) { //if page value is greater than 3 then add this (...) after the first li or page
            liTag += `<li class="dots"><span>...</span></li>`;
        }
    }


    for (var plength = beforePage; plength <= afterPage; plength++) {
        if (plength > totalPages) { //if plength is greater than totalPage length then continue
            continue;
        }
        if (plength <= 0) { //if plength is 0 than add +1 in plength value
            plength = plength + 1;
        }
        if (page === plength) { //if page is equal to plength than assign active string in the active variable
            active = "active";
        } else { //else leave empty to the active variable
            active = "";
        }
        //    liTag += `<li class="numb ` + (active) + `" onclick="createPagination(totalPages, ` + (plength) + `)"><span>` + (plength) + `</span></li>`;
        liTag += `<li class="numb ` + (active) + `" onclick="createPagination(totalPages, ` + (plength) + `)"><span><a href="ViewPostController?index=` + (plength) + `&search=` + "${Search}" + `">` + (plength) + `</a></span></li>`;

    }

    if (page < totalPages - 1) { //if page value is less than totalPage value by -1 then show the last li or page
        if (page < totalPages - 2) { //if page value is less than totalPage value by -2 then add this (...) before the last li or page
            liTag += `<li class="dots"><span>...</span></li>`;
        }
        liTag += `<li class="last numb" onclick="createPagination(totalPages, ` + (totalPages) + `)"><span><a href="ViewPostController?index=` + (totalPages) + `&search=` + "${Search}" + `">` + (totalPages) + `</a></span></li>`;
    }

    if (page < totalPages) { //show the next button if the page value is less than totalPage
        liTag += `<li class="btn next" onclick="createPagination(totalPages, ` + (page + 1) + `)"><span> <a href="ViewPostController?index=` + (page + 1) + `&search=` + "${Search}" + `"><i class="fas fa-angle-right"></i></a></span></li>`;
    }
    elem.innerHTML = liTag; //add li tag inside ul tag
    return liTag; //return the li tag

}
