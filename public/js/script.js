$(document).ready(function() {
    $("[href]").each(function() {
        if (this.href == window.location.href) {
            $(this).addClass("active");
        }
    });
});

$('#input').on('keypress', function(e){
    if(e.which == 13) {
        searchFilter();
    }
})
// Search functie --- AJAX 
function searchFilter(){
    event.preventDefault();
    var filter = $('#input').val() + '%';
    $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/users/search/',
        data: {filter: filter},
        datatype: 'JSON',
        success: function(data){
            parseData(data)
        },
        error: function(){
            alert('Something went wrongk')
        }
    })
}
// Search functie --- parsing
function parseData(data){
    $('#inserts').empty();
        if(data.rows.length === 0){
                $('<tr>').append(
                    $('<th scope="row" class="animateLeft">').text(`Niks gevonden`),
                    $('<td class="animateLeft">'),
                    $('<td class="animateLeft">'),
                    $('<td class="animateLeft">')
                ).appendTo('#inserts');
        } else {
        for(var i = 0; i < data.rows.length; i++){
            $('<tr>').append(
                $('<th scope="row" class="animateLeft">').text(`${data.rows[i].naam}`),
                $('<td class="animateLeft">').text(`${data.rows[i].zaal}`),
                $('<td class="animateLeft">').text(`$${data.rows[i].prijs}`),
                $('<td class="animateLeft kaartje"><i class="fas fa-shopping-cart"></i></td>')
            ).appendTo('#inserts');
        }  
    }
    // Event handler drukken op winkelwagen
    $('.kaartje').on('click', function(e){
        var prijs = $(e.target).parent().prev().html();
        var zaal = $(e.target).parent().prev().prev().html();
        var artiest = $(e.target).parent().prev().prev().prev().html();
        $('.concertinfo').empty();
        $('.concertinfo').append(`<p>${artiest}</p>`);
        $('.concertinfo').append(`<p>1</p>`);
        $('.concertinfo').append(`<p>${zaal}</p>`)
        $('.concertinfo').append(`<p>${prijs}</p>`);


        if(!data.isloggedin.gebruiker_id){
            alert('log alstublieft eerst in')
        } else {
            getUser(data.isloggedin.gebruiker_id);
        }
        // $('#exampleModal').modal('show');
        // document.querySelector('.modal-body p').innerHTML += `${prijs}`;
    })
}

// Get user --- AJAX
function getUser(gebruiker){
    event.preventDefault();
    var gebruiker_id = gebruiker;
    $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/users/getuser/',
        data: {gebruiker_id: gebruiker_id},
        datatype: 'JSON',
        success: function(data){
            $('.persooninfo').empty();

            $('.persooninfo').append(`<p>${data.rows[0].naam}</p>`);
            $('.persooninfo').append(`<p>${data.rows[0].tussenvoegsel}</p><br>`);
            $('.persooninfo').append(`<p>${data.rows[0].achternaam}</p>`);
            $('.persooninfo').append(`<p>${data.rows[0].email}</p>`);
            
            $('#exampleModal').modal('show');

        },
        error: function(){
            alert('user get went wronk')
        }
    })
}
// Event handler van klikken betalen
function betalen (){
    $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/users/betalen/',
        success: function(){
            console.log('Alles goed')
        },
        error: function(){
            alert('Somethign wornk')
        }
    })

}