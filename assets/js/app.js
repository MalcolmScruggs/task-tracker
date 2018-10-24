// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
import "phoenix_html";
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery; // Bootstrap requires a global "$" object.
import "bootstrap";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

$(function () {
    $('#start-work-button').click((ev) => {
        let task_id = $(ev.target).data('task-id');
        let date = new Date();

        let task_time ={
           task_id: task_id,
           start_time: date.toISOString()
        };
        let data = JSON.stringify({
            task_time: task_time
        });

        $.ajax("/ajax/times", {
            method: "post",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            data: data,
            success: (resp) => {
                location.reload();
            }
           }
        );
    });

    $('#stop-work-button').click((ev) => {
        let id = $(ev.target).data('time-id');
        let date = new Date();

        let task_time = {
            end_time: date.toISOString()
        };
        let data = JSON.stringify({
            task_time: task_time
        });

        $.ajax(`/ajax/times/${id}`, {
               method: "patch",
               dataType: "json",
               contentType: "application/json; charset=UTF-8",
               data: data,
               success: (resp) => {
                   location.reload();
               }
           }
        );
    });
});
