var board_json = null;
var score = 0;

$(document).ready(function () {
    $(document).keydown(function (event) {
        var key = event.which - 37;
        if (key === 45) {
            key = 4;
            reset();
        }
        else if (key >= 0 && key <= 3) {
            move(key);
        }
        else
            return;
        $("#output").html("Key: " + key);

    });

    reset();

});

function move(direction) {
    $.ajaxSetup({
        url: "/move/",
        complete: function (XMLHttpRequest, textStatus) {
            if (XMLHttpRequest.status === 200) { // Success
                response_obj = JSON.parse(XMLHttpRequest.responseText);
                if (response_obj['islose'] === true) {
                    console.log('Lose case:');
                    console.log(board_json);
                    console.log(JSON.stringify(response_obj['board']));
                }
                board_json = JSON.stringify(response_obj['board']);
                draw_board(response_obj['board']);
                score = response_obj['score'];
                if (response_obj['iswin'] === true)
                    $("#score").text("Score: "+ score + " | You get 2048!");
                else
                    // $("#score").text("Score: "+ score);
                    if (response_obj['islose'] === true)
                        $("#score").text("Score: "+ score + " | You lose the game!");
                    else
                        $("#score").text("Score: "+ score);
            } else {
                alert("Error: " + XMLHttpRequest.status + " " + textStatus);
            }

        },
        type: "POST",
        global: false,
        contentType: "application/x-www-form-urlencoded",
        dataType: "json"
    });

    $.ajax({data: {'board': board_json, 'direction': direction, 'score': score}});
}

function reset() {
    var settings = {
        "async": true,
        "crossDomain": true,
        "url": "/reset/",
        "method": "POST",
        "processData": false,
        "contentType": false,
        "dataType": "text",
        "mimeType": "text/javascript"
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        response_obj = JSON.parse(response);
        board_json = JSON.stringify(response_obj['board']);
        draw_board(response_obj['board']);
        score = response_obj['score'];
        $("#score").text("Score: "+ score);
    });
}

function draw_board(board) {
    for (var i=0; i<board.length; i++) {
        for (var j=0; j<board[i].length; j++) {
            if (board[i][j] > 0)
                $("#row"+(i+1)+">td:eq("+(j)+")").text(board[i][j]);
            else
                $("#row"+(i+1)+">td:eq("+(j)+")").text("");
        }
    }
}