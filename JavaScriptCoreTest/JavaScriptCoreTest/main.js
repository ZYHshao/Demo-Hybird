(function(){
    console.log("ProgectInit");
    return render();
})();

 
function Label(rect,text,color){
    this.rect = rect;
    this.text = text;
    this.color = color;
    this.typeName = "Label";
}

function Button(rect,text,callFunc){
    this.rect = rect;
    this.text = text;
    this.callFunc = callFunc;
    this.typeName = "Button";
}

function Rect(x,y,width,height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
}
function Color(r,g,b,a){
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
}
 
 function render(){
    var rect = new Rect(20,100,280,30);
    var color = new Color(1,0,0,1);
    var label = new Label(rect,"Hello World",color);
    var rect2 = new Rect(20,150,280,30);
    var color2 = new Color(0,1,0,1);
    var label2 = new Label(rect2,"Hello Native",color2);
    var rect3 = new Rect(20,200,280,30);
    var color3 = new Color(0,0,1,1);
    var label3 = new Label(rect3,"Hello JavaScript",color3);
    var rect4 = new Rect(20,240,280,30);
    var button = new Button(rect4,"我是一个按钮",function(){
                            var randColor = new Color(Math.random(),Math.random(),Math.random(),1);
                            Globle.changeBackgroundColor(randColor);
                            });
    return [label,label2,label3,button];
 }


