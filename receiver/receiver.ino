HardwareSerial mySerial(2);

void setup() {
Serial.begin(115200);
delay(3000);   // IMPORTANT: wait for serial monitor

Serial.println("RECEIVER READY");

mySerial.begin(9600, SERIAL_8N1, 16, 17);
}

void loop() {
if (mySerial.available()) {
String msg = mySerial.readStringUntil('\n');
Serial.println(msg);
}
}
