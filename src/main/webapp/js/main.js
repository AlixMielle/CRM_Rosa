// clear de la la recherche
/*const button1 = document.getElementById("clearButton")
button1.addEventListener("click", (event)=>{
        window.location = "/enterprises/all";
})*/

const button2 = document.getElementById("sortAlphabetButton")
button2.addEventListener("click", (event)=>{
    //window.location = "/enterprises/all/sorted";
    const fragment = document.createDocumentFragment();
    const sheet = document.getElementById("enterpriseSheet");
    const enterprises = sheet.querySelectorAll("tr");
    const sortedList = [...enterprises].sort((a, b) =>{
        const aSorter = a.getElementsByClassName("enterpriseName")[0].innerHTML;
        const bSorter = b.getElementsByClassName("enterpriseName")[0].innerHTML;
        return aSorter < bSorter ? -1 : aSorter > bSorter ? 1 : 0;
    });
    for (const enterprise of sortedList){
        fragment.appendChild(enterprise);
    }
    sheet.appendChild(fragment)
})

const button3 = document.getElementById("sortReverseAlphabetButton")
button3.addEventListener("click", (event)=>{
    //window.location = "/enterprises/all";
    const fragment = document.createDocumentFragment();
    const sheet = document.getElementById("enterpriseSheet");
    const enterprises = sheet.querySelectorAll("tr");
    const sortedList = [...enterprises].sort((a, b) =>{
        const aSorter = a.getElementsByClassName("enterpriseName")[0].innerHTML;
        const bSorter = b.getElementsByClassName("enterpriseName")[0].innerHTML;
        return aSorter > bSorter ? -1 : aSorter < bSorter ? 1 : 0;
    });
    for (const enterprise of sortedList){
        fragment.appendChild(enterprise);
    }
    sheet.appendChild(fragment)
})

const button4 = document.getElementById("sortDateButton")
button4.addEventListener("click", (event)=>{
    //window.location = "/enterprises/all/sorted";
    const fragment = document.createDocumentFragment();
    const sheet = document.getElementById("enterpriseSheet");
    const enterprises = sheet.querySelectorAll("tr");
    const sortedList = [...enterprises].sort((a, b) =>{
        const aSorter = a.getElementsByClassName("createdAt")[0].innerHTML;
        const bSorter = b.getElementsByClassName("createdAt")[0].innerHTML;
        return aSorter < bSorter ? -1 : aSorter > bSorter ? 1 : 0;
    });
    for (const enterprise of sortedList){
        fragment.appendChild(enterprise);
    }
    sheet.appendChild(fragment)
})

const button5 = document.getElementById("sortReverseDateButton")
button5.addEventListener("click", (event)=>{
    //window.location = "/enterprises/all";
    const fragment = document.createDocumentFragment();
    const sheet = document.getElementById("enterpriseSheet");
    const enterprises = sheet.querySelectorAll("tr");
    const sortedList = [...enterprises].sort((a, b) =>{
        const aSorter = a.getElementsByClassName("createdAt")[0].innerHTML;
        const bSorter = b.getElementsByClassName("createdAt")[0].innerHTML;
        return aSorter > bSorter ? -1 : aSorter < bSorter ? 1 : 0;
    });
    for (const enterprise of sortedList){
        fragment.appendChild(enterprise);
    }
    sheet.appendChild(fragment)
})

const button6 = document.getElementById("sortAlphabetButton")
button6.addEventListener("click", (event)=>{
    //window.location = "/enterprises/all/sorted";
    const fragment = document.createDocumentFragment();
    const sheet = document.getElementById("enterpriseSheet");
    const enterprises = sheet.querySelectorAll("tr");
    const sortedList = [...enterprises].sort((a, b) =>{
        const aSorter = a.getElementsByClassName("prospectLastName")[0].innerHTML;
        const bSorter = b.getElementsByClassName("prospectLastName")[0].innerHTML;
        return aSorter < bSorter ? -1 : aSorter > bSorter ? 1 : 0;
    });
    for (const enterprise of sortedList){
        fragment.appendChild(enterprise);
    }
    sheet.appendChild(fragment)
})

const button7 = document.getElementById("sortReverseAlphabetButton")
button7.addEventListener("click", (event)=>{
    //window.location = "/enterprises/all";
    const fragment = document.createDocumentFragment();
    const sheet = document.getElementById("enterpriseSheet");
    const enterprises = sheet.querySelectorAll("tr");
    const sortedList = [...enterprises].sort((a, b) =>{
        const aSorter = a.getElementsByClassName("prospectLastName")[0].innerHTML;
        const bSorter = b.getElementsByClassName("prospectLastName")[0].innerHTML;
        return aSorter > bSorter ? -1 : aSorter < bSorter ? 1 : 0;
    });
    for (const enterprise of sortedList){
        fragment.appendChild(enterprise);
    }
    sheet.appendChild(fragment)
})



