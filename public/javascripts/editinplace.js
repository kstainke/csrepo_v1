Event.observe(window, ‘load’, init, false);

 function init(){
     makeEditable(‘desc’);
 }

 function makeEditable(id){
     Event.observe(id, ‘click’, function(){edit($(id))}, false);
     Event.observe(id, ‘mouseover’, function(){showAsEditable($(id))}, false);
     Event.observe(id, ‘mouseout’, function(){showAsEditable($(id), true)}, false);
 }

 function showAsEditable(obj, clear){
     if (!clear){
          Element.addClassName(obj, ‘editable’);
     }else{
          Element.removeClassName(obj, ‘editable’);
     }
 }