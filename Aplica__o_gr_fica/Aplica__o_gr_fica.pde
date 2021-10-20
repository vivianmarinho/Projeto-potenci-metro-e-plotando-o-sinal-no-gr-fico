import processing.serial.*;

Serial commPort;

int xPos= 1;
//int xPos2 = 1;
float inByte =0;
float inByte2 =0;
String[] vector;
float yPos=1;
float yPos2=1;
float dt=1;

void setup(){

size (800,800);               // tamanho da tela
surface.setTitle("Potenciometros");
background(0,0,51);                // cor de fundo da tela

commPort = new Serial(this, "COM5", 9600); ////Inicializar a comunicação com a porta serial
commPort.bufferUntil('\n'); // As informações que ele irá armazenar vai ser atualizada a cada pular de linha.

}


void draw(){
  
 
  // COLOCANDO O TITULO
  
  textSize(24);
  textAlign(CENTER, TOP);
  text("POTENCIOMETROS",400,50);
  
  stroke(0,204,204); 
  line(0, 100, width, 100);
  line(0, 25, width, 25);
  
  // CONTRUINDO A MOLDURA 
  
  stroke(0,153,153);   
  strokeWeight(20);
  line(0, 0, width, 0);           //linha superior
  line(0, 800, width, 800);       //linha inferior
  line(800, 0, width,800);        //linha 
  line(0,0, 0,800);               // linha esquerda
  
    // CONTRUÇÃO DO GRÁFICO
    
    stroke(127, 34, 255); // determina a cor da linha
    strokeWeight(5);
    line(xPos, yPos, xPos, height - inByte);     // coordenada de X e Y
    yPos = height - inByte;
    stroke(255, 0, 0);
    strokeWeight(5);
    line(xPos, yPos2, xPos, height - inByte2);    //coordenada de X e Y - 2 potenciometro
    yPos2 = height - inByte2;
    
    if (xPos >= width) {        // maior que a largura
    xPos = 0;
    background(0,0,51);
  } else {
       xPos++;   // incrementa a posição na horizontal
  }
    
         
}

void serialEvent (Serial myPort) {
 
   String inString = myPort.readStringUntil('\n');  //receber a serial em forma de string até chegar no \n 
   if (inString != null) {              
   
    inString = trim(inString);                  // para retirar os espaço
    
    vector = split(inString,';');                // separa os danos da String atraves do ; 
    
    println("Potenciometro 1: " + vector[0]);
    println("Potenciometro 2: " + vector[1]);
    
    inByte = map(float(vector[0]), 0, 4095, 0, height - 130 );     // converte a posição do vetor que é string para float
    
    
    inByte2 = map(float(vector[1]), 0, 4095, 0, height - 130);
         
    
}
    

   
}
