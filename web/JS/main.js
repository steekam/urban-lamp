$(document).ready(main);

function main (){
    //hide upload form
    $('#uploadWrap form').hide();
    imageUpload();
}


function imageUpload(){
    $('.upload').on('click',function(){
        //Trigger file choosing
        $('#imageUpload').trigger('click').on('change',function(){
            var file = this.files[0];
            var name = file.name;
            var size = file.size;
            var type = file.type.split('/').pop().toLowerCase();

            var errors = "";
            //EXtension validation
            var accepted_ext = ['jpeg', 'png', 'jpg'];
            var valid = $.inArray(type, accepted_ext);
            
            if (valid == -1) {
                errors += "<p>Please select jpg or png </p>";
            } else if (size > (1024*1024*100)) {
                errors += "<p>Image should be less than 100MB</p>";
            } else {
                var theForm = $('#uploadWrap form');
                var send  = new FormData();
                send.append("profile-image", file);
                var new_path = "";             
                $.ajax({
                    url: "UploadFile.jsp",
                    type: "POST",
                    data: send,
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function (data) {
                        new_path = data;
                    },
                    error: function () {
                        console.log("Error");
                    }    
                }).done(function () {
                    new_path = new_path.trim();
                    var path = "assets/store/user_images/"+new_path;
                    $('.uploaded img').attr('src',path);
                    console.log(new_path);
                    
                });        
            }
        });

    });
}