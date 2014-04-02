/*
  WEB SERVER
 
 WebServer simples com Arduino, utilizando um sensor acelerometro
 para medicao da inclinacao, em um experimento didatico de plano inclinado
 interfaceado com Ipad.

 O webserver arduino envia dados para o cliente (Ipad) onde os dados sao
 processados e gerado graficos e animacoes.
 
 Circuito:
 
 * Ethernet shield W5100 utilizando os pinos 10, 11, 12, 13 (SPI)
 * Acelerometro MMA7361
 * Leitura do X, Y, Z nos pinos (A0, A1, A2)
 * Pinos de configuracao (6, 7, 8, 9)
 * Sensor ultrasonico
 * Pinos (triger 2, echo 4)
 
  Ezequiel Franca
  03/2014
  BEPID - SENAC
  BRAZIL EDUCATION PROGRAM FOR IOS DEVELOPMENT
 
 */

// Bibliotecas
#include <SPI.h>
#include <Ethernet.h>
#include <AcceleroMMA7361.h>

// Variaveis para o acelerometro
  AcceleroMMA7361 accelero;
  int x;
  int y;
  int z;

// variaveis para o sensor ultrasonico
  const int trigPin = 2;
  const int echoPin = 4;

//Configuracao de rede, verifique o range de ip da sua rede
  byte mac[] = { 
    0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
    IPAddress ip(192,168,1,177);

// Inicializa Ethernet server com o ip acima e a porta selecinada
// (A porta 80 e a  default para o protocolo HTTP):
    EthernetServer server(80);

void setup() {
 //Abre a comunicacao serial, configura o acelerometro e aguarda
 Serial.begin(9600);
 accelero.begin(9, 8, 7, 6, A0, A1, A2);
 accelero.setARefVoltage(5);                   //pode ser com 3.3V
 accelero.setSensitivity(LOW);                   //seta a sensibilidade +/-6G
 accelero.calibrate();
  while (!Serial) {
    ; // Aguarda comunicacao serial
  }

  // Inicia a conexao ethernet
  Ethernet.begin(mac, ip);
  server.begin();
  Serial.print("server esta em:  ");
  Serial.println(Ethernet.localIP());
}


void loop() {
  
  //Variaveis para sensor ultrassonico
  // duracao do "ping" do sensor,
  // cm para converter a distancia em cm.
  long duracao, cm;
  
  EthernetClient client = server.available();
  if (client) {
    Serial.println("novo cliente");
    // uma requisicao http termina com uma linha em branc
    boolean currentLineIsBlank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        Serial.write(c);
        
        // Pega o valor Z do acelerometro
        z = accelero.getZRaw();
        
        //Pega o valor do sensor ultrasonico

        
// The sensor is triggered by a HIGH pulse of 10 or more microseconds.
// Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
        pinMode(trigPin, OUTPUT);
        digitalWrite(trigPin, LOW);
        delayMicroseconds(2);
        digitalWrite(trigPin, HIGH);
        delayMicroseconds(10);
        digitalWrite(trigPin, LOW);
        
// Read the signal from the sensor: a HIGH pulse whose
// duration is the time (in microseconds) from the sending
// of the ping to the reception of its echo off of an object.
        pinMode(echoPin, INPUT);
        duracao = pulseIn(echoPin, HIGH);
        
//Converte a distancia em cm // daora*
        cm = microsegundosParaCentimetros(duracao);
   
// if you've gotten to the end of the line (received a newline
// character) and the line is blank, the http request has ended,
// so you can send a reply
        if (c == '\n' && currentLineIsBlank) {
          // cabecalho HTTP padrao para GET
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/json");
          //client.println("Connection: close");  // a conexao sera fechada apos a reposta do request
	  //client.println("Refresh: 2");  // atualiza a cada 2 segundos
    client.println();
          // preparacao do JSON
    client.print(" \{ \"Altura\": ");
    z = 384 - z;
    client.print((float)z);
    
    client.print(", \"Distancia\": ");
    client.print((float)cm);
    client.print("} "); 
    
    // tempinho para o json ser recebido
    delay(1);
    // fecha a conexao
    client.stop();
    Serial.println("client desconectado");
  }
}
}
}
}

long microsegundosParaCentimetros(long microsegundos)
{
// A velocidade do som é de 340 m/s ou 29 microssegundos por centímetro.
// O de ping viaja para fora e para trás, de modo a encontrar a distância do
// objeto que queremos saber a distancia, entao pegamos a metade da distância percorrida, ja que o som vai e volta.
return microsegundos / 29 / 2;
}

