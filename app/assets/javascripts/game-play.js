// $(document).ready(function(){
//   var typos = 0;
//   var counter = 0;
//   var totalChars; // = $("code span").length;
//   var totalKeypress = 0;
//   var startTime = new Date();
//   var endTime;
//   var CPS;


//   var spannify = function(text){
//     var spannedText = ''
//     for(var i = 0; i < text.length; i++){
//       spannedText = spannedText + '<span class="untyped">'+text[i]+'</span>'
//     }
//     return spannedText
//   };

//   var sendData = function(){
//     console.log("Total Keypress: " + totalKeypress)
//     console.log("Total totalChars: " + totalChars)
//     console.log("Total typos: " + typos)
//     console.log("Total time: " + ((endTime - startTime)/1000))
//     console.log("Total CPS(chars per second): " + (totalKeypress / ((endTime - startTime)/1000)))
//   };

//   // ----------------------------------------

//   var moveCursor = function(){
//     $("code span:nth-child("+counter+")").removeClass('cursor')
//     $("code span:nth-child("+(counter + 1)+")").addClass('cursor')
//   };

//   var markBGRed = function(){
//     $(".cursor").css("color", "red")
//   };

//   var updateIncorrect = function(){
//     typos++;
//     $("#incorrect").html(typos);
//   };//incorrect

//   var addClassTyped = function(){
//     $("code span:nth-child("+counter+")").removeClass('untyped')
//     $("code span:nth-child("+counter+")").addClass('typed')
//   };

//   var isComplete = function(){
//     if (counter === totalChars){
//       $(document).off('keypress');
//       alert("Send Data to Rails")
//       endTime = new Date();
//       sendData();
//     }
//   }; //isComplete


//   var getChars = function(){
//     var chars = [];
//     $.each($("code span"), function(i,e){
//       chars.push(e.innerHTML)
//     })
//     return chars
//   };//getChars

//   var newCheck = function(keypress){
//     characters = getChars()
//     if (keypress === characters[counter] ){
//       counter++
//       addClassTyped();
//       moveCursor();
//     } 
//     else {
//       markBGRed()
//       updateIncorrect();
//     }
//   }; //newCheck

//   var listen = function(){
//     $(document).keypress(function(event){
//       event.preventDefault()
//     totalChars = $("code span").length;
//       totalKeypress++;
//       moveCursor();
//       newCheck( String.fromCharCode(event.which) );      
//       isComplete()
//     });
//   }; //listen

//   listen();
// });//doc ready
