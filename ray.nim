import raylib/raylib

let
  WHITE* = Color(r: 255.cuchar, g: 255.cuchar, b: 255.cuchar, a: 255.cuchar)
  RAYWHITE* = Color(r: 245.cuchar, g: 245.cuchar, b: 245.cuchar, a: 255.cuchar)
  LIGHTGRAY* = Color(r: 200.cuchar, g: 200.cuchar, b: 200.cuchar, a: 255.cuchar)
  DARKGRAY* = Color(r: 80.cuchar, g: 80.cuchar, b: 80.cuchar, a: 255.cuchar)
  RED* = Color(r: 230.cuchar, g: 41.cuchar, b: 55.cuchar, a: 255.cuchar)
  BLACK* = Color(r: 0.cuchar, g: 0.cuchar, b: 0.cuchar, a: 255.cuchar)

var
  x = 0.cint
  y = 0.cint
  idx = 1.cint
  idy = 0.cint

proc Update() =
  if (IsKeyDown(KEY_LEFT_SHIFT)):
    if (IsKeyPressed(KEY_LEFT)):
      idx -= 1
    elif (IsKeyPressed(KEY_RIGHT)):
      idx += 1
    if (IsKeyPressed(KEY_UP)):
      idy -= 1
    elif (IsKeyPressed(KEY_DOWN)):
      idy += 1
  else:
    if (IsKeyDown(KEY_LEFT)):
      x -= 1
    elif (IsKeyDown(KEY_RIGHT)):
      x += 1
    if (IsKeyDown(KEY_UP)):
      y -= 1
    elif (IsKeyDown(KEY_DOWN)):
      y += 1
  if(x > 320):
    x = 0
  elif(x < 0):
    x = 320
  if(y > 180):
    y = 0
  elif(y < 0):
    y = 180

InitWindow(1440, 810, "raylib [core] example - basic window")
SetTargetFPS(60)
var canvas = LoadRenderTexture(320, 180); 
SetTextureFilter(canvas.texture, FILTER_POINT.cint)
var spritestx = LoadTexture("sprites.png")
while not WindowShouldClose():
  Update()
  BeginTextureMode(canvas)
  ClearBackground(BLACK)
  DrawTexturePro(spritestx, Rectangle(x:idx*8, y:idy*8, width:8, height: 8), Rectangle(x:x, y:y, width:8, height: 8), Vector2(x:0, y:0), 0, WHITE)
  EndTextureMode()
  
  BeginDrawing()
  DrawTexturePro(canvas.texture, 
    Rectangle(x:0, y:0, width:canvas.texture.width, height: -canvas.texture.height), 
    Rectangle(x:0, y:0, width:1440, height: 810), 
    Vector2(x:0, y:0), 0, WHITE)
  EndDrawing()

UnloadRenderTexture(canvas)
CloseWindow()

