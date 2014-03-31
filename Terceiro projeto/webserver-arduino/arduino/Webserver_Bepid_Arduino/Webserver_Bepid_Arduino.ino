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
 
  Ezequiel Franca
  03/2014
  BEPID - SENAC
  BRAZIL EDUCATION PROGRAM FOR IOS DEVELOPMENT
 
 */

// Bibliotecas
#include <SPI.h>
#include <Ethernet.h>
#include <AcceleroMMA7361.h>

AcceleroMMA7361 accelero;
int x;
int y;
int z;

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
 
  EthernetClient client = server.available();
  if (client) {
    Serial.println("novo cliente");
    // uma requisicao http termina com uma linha em branc
    boolean currentLineIsBlank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        Serial.write(c);
        z = accelero.getZRaw();
        // if you've gotten to the end of the line (received a newline
        // character) and the line is blank, the http request has ended,
        // so you can send a reply
        if (c == '\n' && currentLineIsBlank) {
          // cabecalho HTTP padrao para GET
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/json");
          client.println("Connection: close");  // a conexao sera fechada apos a reposta do request
	  client.println("Refresh: 2");  // atualiza a cada 2 segundos
          client.println();
          // preparcao do JSON
          client.print(" \{ \"Sensor:\" ");
          client.print((float)z);
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

