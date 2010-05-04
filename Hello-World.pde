void setup() {
}

int ledPin = 11;
void loop() {
  delay(1000);
  digitalWrite(ledPin, HIGH);
  Keyboard.print("Hello World");
  delay(1000);
  digitalWrite(ledPin, LOW);
  delay(5000);
}

