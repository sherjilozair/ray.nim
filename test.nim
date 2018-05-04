discard """
let
  WHITE* = Color(r:255, g:255, b:255, a:255)
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

init_window(1440, 810, "raylib [core] example - basic window")

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
"""

import ray
const scale = 1

init_window(320*5, 180*5, "Test Title")
var texture = load_texture("sprites.png")
var canvas = load_render_texture(160, 90)

while not window_should_close():
  draw_with(canvas):
    for i in 0..<16:
      for j in 0..<8:
        draw(texture, Rectangle(x: 8*i, y: 8*j, w: 8, h: 8), Rectangle(x: 8*scale*i, y: 8*j*scale, w: 8*scale, h: 8*scale))


close_window()

