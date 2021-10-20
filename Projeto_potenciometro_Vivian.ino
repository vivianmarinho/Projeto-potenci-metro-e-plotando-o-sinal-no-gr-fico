
#define led 23  //saida do led
#define pino_sensor  13 // Entrada AD do potenciometro do LED
#define potenciometro 36  // entrada AD do potenciometro

int potencia =0;



void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);     // inicia a porta serial, configura a taxa de dados para 9600 bps


  pinMode(pino_sensor, INPUT);           // PINO DE ENTRADA 
  pinMode(led, OUTPUT);                 //PINO DE SAÍDA
  pinMode(potenciometro, INPUT);        // PINO DE ENTRADA
 

}

void loop() {

    
  potencia = analogRead(pino_sensor);
  
  digitalWrite(led, potencia);

  Serial.print(analogRead(pino_sensor));
  Serial.print(";");                        // separando os dois sinais por um ;
  Serial.println(analogRead(potenciometro)); 
  delay (250);
  







}
