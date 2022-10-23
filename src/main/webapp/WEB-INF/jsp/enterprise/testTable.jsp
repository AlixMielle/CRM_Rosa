<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Table Sortable</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="../jquery.min.js"></script>
    <script src="https://table-sortable.now.sh/table-sortable.js"></script>
</head>

<body>
<div class="page-container">
    <div class="container">
        <h1 class="display-4">Table Sortable</h1>
        <h5>A jquery plugin to sort and paginate data in table form</h5>
        <h6>
            <a href="story-latest.html">View full documentation</a>
        </h6>
        <div class="row mt-5 mb-3 align-items-center">
            <div class="col-md-5">
                <button class="btn btn-primary btn-sm" id="rerender">Re-Render</button>
                <button class="btn btn-primary btn-sm" id="distory">Distory</button>
                <button class="btn btn-primary btn-sm" id="refresh">Refresh</button>
            </div>
            <div class="col-md-3">
                <input type="text" class="form-control" placeholder="Search in table..." id="searchField">
            </div>
            <div class="col-md-2 text-right">
                <span class="pr-3">Rows Per Page:</span>
            </div>
            <div class="col-md-2">
                <div class="d-flex justify-content-end">
                    <select class="custom-select" name="rowsPerPage" id="changeRows">
                        <option value="1">1</option>
                        <option value="5" selected="">5</option>
                        <option value="10">10</option>
                        <option value="15">15</option>
                    </select>
                </div>
            </div>
        </div>
        <div id="root"><div class="gs-table-container"><table class="table gs-table"><thead class="gs-table-head"><tr><th><span role="button" class="gs-button">Form Code</span></th><th><span role="button" class="gs-button">Form Name<span>▼</span></span></th></tr></thead><tbody class="gs-table-body"><tr><td>531790</td><td>Investment Form 2</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr><tr><td>531334</td><td>Investment Form 3</td></tr></tbody></table><div class="gs-pagination"><div class="row"><div class="col-md-6"><span>Showing 1 to 10 of 20 rows</span></div><div class="col-md-6"><div class="btn-group d-flex justify-content-end"><button class="btn btn-default" disabled="disabled"><span>Prev</span></button><button class="btn btn-primary active" data-page="0">1</button><button class="btn btn-default" data-page="1">2</button><button class="btn btn-default" disabled="disabled">...</button><button class="btn btn-default"><span>Next</span></button></div></div></div></div></div></div>
        <div class="mt-4">
            <button class="btn btn-secondary" id="setPage2">Set Page 2</button>
        </div>
    </div>
</div>

<script>
    var table = $('#table-sortable').tableSortable({
        data: data,
        columns: columns,
        searchField: '#searchField',
        responsive: {
            1100: {
                columns: {
                    formCode: 'Form Code',
                    formName: 'Form Name',
                },
            },
        },
        rowsPerPage: 5,
        pagination: true,
        tableWillMount: function() {
            console.log('table will mount')
        },
        tableDidMount: function() {
            console.log('table did mount')
        },
        tableWillUpdate: function() {console.log('table will update')},
        tableDidUpdate: function() {console.log('table did update')},
        tableWillUnmount: function() {console.log('table will unmount')},
        tableDidUnmount: function() {console.log('table did unmount')},
        onPaginationChange: function(nextPage, setPage) {
            setPage(nextPage);
        }
    });

    $('#changeRows').on('change', function() {
        table.updateRowsPerPage(parseInt($(this).val(), 10));
    })

    $('#rerender').click(function() {
        table.refresh(true);
    })

    $('#distory').click(function() {
        table.distroy();
    })

    $('#refresh').click(function() {
        table.refresh();
    })

    $('#setPage2').click(function() {
        table.setPage(1);
    })
</script>


</body>
</html>