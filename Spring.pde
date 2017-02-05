class Spring{
  PVector pos,force;int index;
  float r; char z;String name;
  Spring(String naam,char zone,int area,int i){
    r=map(area,0,40000,0,500);
    index=i;
    z=zone;name=naam;
    switch(zone){
     case('A'): pos=new PVector(random(80,240),random(240));break;
     case('B'): pos=new PVector(random(240,400),random(480));break;
     case('C'): pos=new PVector(random(80),random(240));break;
     case('E'): pos=new PVector(random(240),random(240,480));break;
     case('D'): pos=new PVector(random(400),random(480,600));break;
      
    }
    

    force=new PVector(0,0);
    
  }
  void update(){
    for(int i=0;i<12;i++){
      Spring bro=springerolls[i];
      float distt=PVector.dist(bro.pos,pos);
      PVector f=new PVector(0,0);
  
      if(distt<(bro.r+r)/1.95){
        f=PVector.sub(bro.pos,pos);
        f.setMag(-2);
        force.add(f);
      }
      f=PVector.sub(bro.pos,pos);
        f.setMag(distt*threshold(bro.index,index)/50000);
        force.add(f);
  

    }
    pos.add(force);
    force.set(0,0);
    
    //limit
    
    switch(z){
     case('A'): pos.x=constrain(pos.x,80,240);pos.y=constrain(pos.y,0,240);break;
     case('B'): pos.x=constrain(pos.x,240,400);pos.y=constrain(pos.y,0,480);break;
     case('C'): pos.x=constrain(pos.x,0,80);pos.y=constrain(pos.y,0,240);break;
     case('E'): pos.x=constrain(pos.x,0,240);pos.y=constrain(pos.y,240,480);break;
     case('D'): pos.x=constrain(pos.x,0,400);pos.y=constrain(pos.y,480,600);break;
      
    }
  }
  
  void show(){
    noFill();strokeWeight(4);
    ellipse(pos.x,pos.y,r,r);
//    rect(pos.x-r/2,pos.y-r/2,r,r);
    fill(0);textSize(12);
    text(name,pos.x,pos.y);
  }
  
  float threshold(int h,int j){ //proximity analysis values
    if(h==j)return 0;
    int p,q;
    if(h<j){
      p=h;q=j;
    }
    else{
      p=j;q=h;
    }
    //p is smaller, q is larger
//      springerolls[0]=new Spring("Perception Lab",'B',5679,0);
//  springerolls[1]=new Spring("Cognition Lab",'A',5679,1);
//  springerolls[2]=new Spring("Expression Lab",'B',5679,2);
//  springerolls[3]=new Spring("Fabrication Lab",'C',5679,3);
//  springerolls[4]=new Spring("Galleria",'E',5679,4);
//  springerolls[5]=new Spring("Training",'E',5679,5);
//  springerolls[6]=new Spring("Accommodation",'A',6679,6);
//  springerolls[7]=new Spring("Classrooms",'B',5679,7);
//  springerolls[8]=new Spring("Cafeteria",'B',5679,8);
//  springerolls[9]=new Spring("Entry",'D',5679,9);
//  springerolls[10]=new Spring("Admin",'B',5679,10);
//springerolls[11]=new Spring("Entry",'C',3679,11);
    switch(p){
      case(0):if(q==1 || q==2 || q==5)return 50;break;
      case(1):if(q==2)return 50;if(q==7)return 80;break;
      case(2):if(q==4 || q==8 || q==6)return 70;if(q==7)return 60;break;
      case(3):if(q==5)return 60;if(q==11)return 20;break;
      case(4):if(q==7)return -10;if(q==9)return 100;break;
      case(5):break;
      case(6):break;
      case(7):if(q==10)return 40;break;
      case(8):break;
      case(9):if(q==10)return 5;break;
  
    }
    return 0;
  }
}
