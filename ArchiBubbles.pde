Spring [] springerolls=new Spring[12];
void setup(){
  size(400,600);
  springerolls[0]=new Spring("Perception Lab",'B',5679,0);
  springerolls[1]=new Spring("Cognition Lab",'A',2679,1);
  springerolls[2]=new Spring("Expression Lab",'B',9679,2);
  springerolls[3]=new Spring("Fabrication Lab",'C',6679,3);
  springerolls[4]=new Spring("Galleria",'E',12679,4);
  springerolls[5]=new Spring("Training",'E',12679,5);
  springerolls[6]=new Spring("Accommodation",'A',4679,6);
  springerolls[7]=new Spring("Classrooms",'B',3679,7);
  springerolls[8]=new Spring("Cafeteria",'B',2679,8);
  springerolls[9]=new Spring("Entry",'D',5679,9);
  springerolls[10]=new Spring("Admin",'B',4679,10);
  springerolls[11]=new Spring("Entry",'C',3679,11);
 
}
void draw(){

  background(255);
    fill(220);stroke(0);strokeWeight(2);
  rect(0,0,80,240);//zone c
  rect(80,0,160,240);//zone a
  rect(240,0,160,480);//zone b
  rect(0,240,240,240);//zone e
  rect(0,480,400,120);//zone d
  
  
  for(int i=0;i<12;i++){
    Spring yewala=springerolls[i];
    yewala.update();
    yewala.show();
    if(mousePressed){
    if(dist(yewala.pos.x,yewala.pos.y,mouseX,mouseY)<yewala.r/2){
      springerolls[i].pos=new PVector(mouseX,mouseY);
    }
    }
  }
  

}
