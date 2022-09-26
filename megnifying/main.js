// __________________________________jS onmousemove megnifying_____________


// const jQuery = require("./jquery");
// var magnifying_area = document.getElementById("magnifying_area");
// var magnifying_img = document.getElementById("magnifying_img");

// magnifying_area.addEventListener("mousemove",function(event){
//    clientX= event.clientX - magnifying_area.offsetLeft;
//    clientY= event.clientY - magnifying_area.offsetTop;

//    mWidth = magnifying_area.offsetWidth;
//    mHeight =magnifying_area.offsetHeight;

//    clientX = clientX / mWidth * 100;
//    clientY = clientY / mHeight *100;
//    magnifying_img.style.transform=  'translate(-'+clientX+'%,'+'-'+clientY+'%'+') scale(2)';

// });


// magnifying_area.addEventListener( "mouseleave" ,function(){
    
//     magnifying_img.style.transform=  'translate(-50%,-50%) scale(1)';
 
// });

// __________________________________jQuery onmouse megnifying_____________

$(document).ready(function(){
    $(".ali").click(function(){
           alert("ali");
    });
    $("#magnifying_area").mousemove(function (e) { 
        // values: e.clientX, e.clientY, e.pageX, e.pageY
        clientX= event.clientX - this.offsetLeft;
        clientY= event.clientY - this.offsetTop;
        mWidth = this.offsetWidth;
        mHeight =this.offsetHeight;
        clientX = clientX / mWidth * 100;
        clientY = clientY / mHeight *100;
        $("#magnifying_img").css({"transform":`translate(-${clientX}%,-${clientY}%) scale(2)`});
    });
    $("#magnifying_area").mouseleave(function () { 
        $("#magnifying_img").css("transform","translate(-50%,-50%) scale(1)" );
    });

});