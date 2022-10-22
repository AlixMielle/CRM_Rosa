// clear de la la recherche
const button = document.getElementById("clearButton")
button.addEventListener("click", (event)=>{
        window.location = "/enterprises/all";
})



var options = {
    data: data,
    columns: [
        { data: 'Entreprise' },
        { data: 'Informations' },
        { data: 'salary' },
        { data: 'office' }
    ],
    rowsPerPage: 10,
    pagination: true,
    sorting: true,
    totalPages: 100,
    sortingIcons: {
        asc: '<span>▼</span>',
        desc: '<span>▲</span>',
    },
    prevText: '<span>prev<span>',
    nextText: '<span>next<span>',
};

var table = $('#table-sortable').tableSortable(options);

$.get("/api/enterprises", function(data) {
    // or Set new data on table, columns is optional.
    table.setData(data, columns);
})

$('#refresh').click(function() {
    table.refresh();
})





