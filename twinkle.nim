import raylib/libraylib

let
  screenWidth = 1440.cint
  screenHeight = 810.cint

var
  x = (screenWidth/2 - 200).cint
  y = (screenHeight/2-10).cint
  fontSize = 20.cint

proc Update() =
  if(IsKeyDown(KEY_LEFT)):
    x -= 1
  elif(IsKeyDown(KEY_RIGHT)):
    x += 1
  if(IsKeyDown(KEY_UP)):
    y -= 1
  elif(IsKeyDown(KEY_DOWN)):
    y += 1

proc Draw() =
  BeginDrawing()

  ClearBackground(RAYWHITE)
  DrawText("Congrats! You created your first window!", x, y, fontSize, DARKGRAY)

  EndDrawing()

InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window")

while not WindowShouldClose():
  Update()
  Draw()

CloseWindow()

