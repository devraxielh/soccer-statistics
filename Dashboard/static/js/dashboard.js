$(function() {

    $("#detalis").hide();

    $( "#obtener" ).click(function() {

        $("#load").show();

        $.ajax({
            data: {"cuenta" : $( "#red_social" ).val()},
            type: "POST",
            dataType: "json",
            url: "http://127.0.0.1:5000/obtenerdata/twitter",
        })
            .done(function( data, textStatus, jqXHR ) {
                console.log(data);
                $("#load").hide();
            })
            .fail(function( jqXHR, textStatus, errorThrown ) {
                console.log( "La solicitud a fallado: " +  textStatus + " "+ errorThrown);
            });

    });

    $( "#mostrar" ).click(function() {

        $("#load").show();

        $.ajax({
            data: {"cuenta" : $( "#red_social" ).val()},
            type: "POST",
            dataType: "json",
            url: "http://127.0.0.1:5000/mostrardata_Polaridad/twitter",
        })
            .done(function( data, textStatus, jqXHR ) {
                $("#load").hide();
                $("#detalis").show();
                graficar_pie_char(data);
            })
            .fail(function( jqXHR, textStatus, errorThrown ) {
                console.log( "La solicitud a fallado: " +  textStatus + " "+ errorThrown);
            });

        $.ajax({
            data: {"cuenta" : $( "#red_social" ).val()},
            type: "POST",
            dataType: "json",
            url: "http://127.0.0.1:5000/mostrardata_visitas/twitter",
        })
            .done(function( data, textStatus, jqXHR ) {
                $("#load").hide();
                tabla_places(data);
            })
            .fail(function( jqXHR, textStatus, errorThrown ) {
                console.log( "La solicitud a fallado: " +  textStatus + " "+ errorThrown);
            });

    });


});

function graficar_pie_char(data){
    var neg = data[0].c/data[0].total;
    var pos = data[1].c/data[1].total;

    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Sentimiento', 'Porcentaje'],
          ['Negativo',     neg],
          ['Positivo',      pos]
        ]);

        var options = {title:''};

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
    }
}

function removeItemFromArr ( arr, item ) {
    var i = arr.indexOf( item );
    if ( i !== -1 ) {
        arr.splice( i, 1 );
    }
}

function tabla_places(data){
    var i=0;
    $.each(data, function(idx, opt) {
        i=i+1;
        $('#tabla_places').append('<tr><td>'+i+'</td><td>'+opt.place+'</td></tr>');
    });
}