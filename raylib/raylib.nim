when defined(Windows):
  const dynlibraylib = "raylib.dll"

when defined(Linux):
  const dynlibraylib = "libraylib.so"
  {.passL: "-lglfw -lGL -lopenal -lm -lpthread -ldl -lX11 -lXrandr -lXinerama -lXxf86vm -lXcursor".}
  {.deadCodeElim: on.}

when defined(MacOSX):
  const dynlibraylib = "libraylib.dylib"
  {.passL: "-L. -lraylib".}
  {.deadCodeElim: on.}

import strutils
{.passC: "-I\"" & gorge("nimble path raylib").strip() & "/raylib\"".}
{.passC: "-I\"" & gorge("nimble path raylib").strip() & "/raylib/include\"".}
const
  PI* = 3.141592653589793
  MOUSE_LEFT_BUTTON* = 0
  MOUSE_RIGHT_BUTTON* = 1
  MOUSE_MIDDLE_BUTTON* = 2
  MAX_TOUCH_POINTS* = 2
  GAMEPAD_PLAYER1* = 0
  GAMEPAD_PLAYER2* = 1
  GAMEPAD_PLAYER3* = 2
  GAMEPAD_PLAYER4* = 3
  GAMEPAD_PS3_BUTTON_TRIANGLE* = 0
  GAMEPAD_PS3_BUTTON_CIRCLE* = 1
  GAMEPAD_PS3_BUTTON_CROSS* = 2
  GAMEPAD_PS3_BUTTON_SQUARE* = 3
  GAMEPAD_PS3_BUTTON_L1* = 6
  GAMEPAD_PS3_BUTTON_R1* = 7
  GAMEPAD_PS3_BUTTON_L2* = 4
  GAMEPAD_PS3_BUTTON_R2* = 5
  GAMEPAD_PS3_BUTTON_START* = 8
  GAMEPAD_PS3_BUTTON_SELECT* = 9
  GAMEPAD_PS3_BUTTON_UP* = 24
  GAMEPAD_PS3_BUTTON_RIGHT* = 25
  GAMEPAD_PS3_BUTTON_DOWN* = 26
  GAMEPAD_PS3_BUTTON_LEFT* = 27
  GAMEPAD_PS3_BUTTON_PS* = 12
  GAMEPAD_PS3_AXIS_LEFT_X* = 0
  GAMEPAD_PS3_AXIS_LEFT_Y* = 1
  GAMEPAD_PS3_AXIS_RIGHT_X* = 2
  GAMEPAD_PS3_AXIS_RIGHT_Y* = 5
  GAMEPAD_PS3_AXIS_L2* = 3
  GAMEPAD_PS3_AXIS_R2* = 4
  GAMEPAD_XBOX_BUTTON_A* = 0
  GAMEPAD_XBOX_BUTTON_B* = 1
  GAMEPAD_XBOX_BUTTON_X* = 2
  GAMEPAD_XBOX_BUTTON_Y* = 3
  GAMEPAD_XBOX_BUTTON_LB* = 4
  GAMEPAD_XBOX_BUTTON_RB* = 5
  GAMEPAD_XBOX_BUTTON_SELECT* = 6
  GAMEPAD_XBOX_BUTTON_START* = 7
  GAMEPAD_XBOX_BUTTON_UP* = 10
  GAMEPAD_XBOX_BUTTON_RIGHT* = 11
  GAMEPAD_XBOX_BUTTON_DOWN* = 12
  GAMEPAD_XBOX_BUTTON_LEFT* = 13
  GAMEPAD_XBOX_BUTTON_HOME* = 8
  GAMEPAD_XBOX_AXIS_LEFT_X* = 0
  GAMEPAD_XBOX_AXIS_LEFT_Y* = 1
  GAMEPAD_XBOX_AXIS_RIGHT_X* = 3
  GAMEPAD_XBOX_AXIS_RIGHT_Y* = 4
  GAMEPAD_XBOX_AXIS_LT* = 2
  GAMEPAD_XBOX_AXIS_RT* = 5
  MAX_SHADER_LOCATIONS* = 32
  MAX_MATERIAL_MAPS* = 12

type
  Vector2* {.bycopy.} = object
    x*: cfloat
    y*: cfloat

  Vector3* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat

  Vector4* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
    w*: cfloat

  Matrix* {.bycopy.} = object
    m0*: cfloat
    m4*: cfloat
    m8*: cfloat
    m12*: cfloat
    m1*: cfloat
    m5*: cfloat
    m9*: cfloat
    m13*: cfloat
    m2*: cfloat
    m6*: cfloat
    m10*: cfloat
    m14*: cfloat
    m3*: cfloat
    m7*: cfloat
    m11*: cfloat
    m15*: cfloat

  Color* {.bycopy.} = object
    r*: cuchar
    g*: cuchar
    b*: cuchar
    a*: cuchar

  Rectangle* {.bycopy.} = object
    x*: cint
    y*: cint
    width*: cint
    height*: cint

  Image* {.bycopy.} = object
    data*: pointer
    width*: cint
    height*: cint
    mipmaps*: cint
    format*: cint

  Texture2D* {.bycopy.} = object
    id*: cuint
    width*: cint
    height*: cint
    mipmaps*: cint
    format*: cint

  RenderTexture2D* {.bycopy.} = object
    id*: cuint
    texture*: Texture2D
    depth*: Texture2D

  CharInfo* {.bycopy.} = object
    value*: cint
    rec*: Rectangle
    offsetX*: cint
    offsetY*: cint
    advanceX*: cint

  SpriteFont* {.bycopy.} = object
    texture*: Texture2D
    baseSize*: cint
    charsCount*: cint
    chars*: ptr CharInfo

  Camera* {.bycopy.} = object
    position*: Vector3
    target*: Vector3
    up*: Vector3
    fovy*: cfloat
    `type`*: cint

  Camera2D* {.bycopy.} = object
    offset*: Vector2
    target*: Vector2
    rotation*: cfloat
    zoom*: cfloat

  BoundingBox* {.bycopy.} = object
    min*: Vector3
    max*: Vector3

  Mesh* {.bycopy.} = object
    vertexCount*: cint
    triangleCount*: cint
    vertices*: ptr cfloat
    texcoords*: ptr cfloat
    texcoords2*: ptr cfloat
    normals*: ptr cfloat
    tangents*: ptr cfloat
    colors*: ptr cuchar
    indices*: ptr cushort
    vaoId*: cuint
    vboId*: array[7, cuint]

  Shader* {.bycopy.} = object
    id*: cuint
    locs*: array[32, cint]

  MaterialMap* {.bycopy.} = object
    texture*: Texture2D
    color*: Color
    value*: cfloat

  Material* {.bycopy.} = object
    shader*: Shader
    maps*: array[12, MaterialMap]
    params*: ptr cfloat

  Model* {.bycopy.} = object
    mesh*: Mesh
    transform*: Matrix
    material*: Material

  Ray* {.bycopy.} = object
    position*: Vector3
    direction*: Vector3

  RayHitInfo* {.bycopy.} = object
    hit*: bool
    distance*: cfloat
    position*: Vector3
    normal*: Vector3

  Wave* {.bycopy.} = object
    sampleCount*: cuint
    sampleRate*: cuint
    sampleSize*: cuint
    channels*: cuint
    data*: pointer

  Sound* {.bycopy.} = object
    audioBuffer*: pointer
    source*: cuint
    buffer*: cuint
    format*: cint

  Music* = ptr object

  AudioStream* {.bycopy.} = object
    sampleRate*: cuint
    sampleSize*: cuint
    channels*: cuint
    audioBuffer*: pointer
    format*: cint
    source*: cuint
    buffers*: array[2, cuint]

  VrDeviceInfo* {.bycopy.} = object
    hResolution*: cint
    vResolution*: cint
    hScreenSize*: cfloat
    vScreenSize*: cfloat
    vScreenCenter*: cfloat
    eyeToScreenDistance*: cfloat
    lensSeparationDistance*: cfloat
    interpupillaryDistance*: cfloat
    lensDistortionValues*: array[4, cfloat]
    chromaAbCorrection*: array[4, cfloat]

# window
proc InitWindow*(width: cint; height: cint; title: cstring) {.stdcall, importc, dynlib: dynlibraylib.}
proc CloseWindow*() {.stdcall, importc, dynlib: dynlibraylib.}
proc IsWindowReady*(): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc WindowShouldClose*(): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsWindowMinimized*(): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc ToggleFullscreen*() {.stdcall, importc, dynlib: dynlibraylib.}
proc SetWindowIcon*(image: Image) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetWindowTitle*(title: cstring) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetWindowPosition*(x: cint; y: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetWindowMonitor*(monitor: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetWindowMinSize*(width: cint; height: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetWindowSize*(width: cint; height: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetScreenWidth*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc GetScreenHeight*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc SetConfigFlags*(flags: cuchar) {.stdcall, importc, dynlib: dynlibraylib.}

# drawing
proc ClearBackground*(color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc BeginDrawing*() {.stdcall, importc, dynlib: dynlibraylib.}
proc EndDrawing*() {.stdcall, importc, dynlib: dynlibraylib.}
proc Begin2dMode*(camera: Camera2D) {.stdcall, importc, dynlib: dynlibraylib.}
proc End2dMode*() {.stdcall, importc, dynlib: dynlibraylib.}
proc BeginTextureMode*(target: RenderTexture2D) {.stdcall, importc, dynlib: dynlibraylib.}
proc EndTextureMode*() {.stdcall, importc, dynlib: dynlibraylib.}

# cursor
proc ShowCursor*() {.stdcall, importc, dynlib: dynlibraylib.}
proc HideCursor*() {.stdcall, importc, dynlib: dynlibraylib.}
proc IsCursorHidden*(): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc EnableCursor*() {.stdcall, importc, dynlib: dynlibraylib.}
proc DisableCursor*() {.stdcall, importc, dynlib: dynlibraylib.}

# misc
proc GetWorldToScreen*(position: Vector3; camera: Camera): Vector2 {.stdcall, importc, dynlib: dynlibraylib.}
proc GetCameraMatrix*(camera: Camera): Matrix {.stdcall, importc, dynlib: dynlibraylib.}
proc ShowLogo*() {.stdcall, importc, dynlib: dynlibraylib.}
proc SetTraceLog*(types: cuchar) {.stdcall, importc, dynlib: dynlibraylib.}
proc TraceLog*(logType: cint; text: cstring) {.varargs, stdcall, importc, dynlib: dynlibraylib.}
proc GetRandomValue*(min: cint; max: cint): cint {.stdcall, importc, dynlib: dynlibraylib.}

# time
proc SetTargetFPS*(fps: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetFPS*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc GetFrameTime*(): cfloat {.stdcall, importc, dynlib: dynlibraylib.}
proc GetTime*(): cdouble {.stdcall, importc, dynlib: dynlibraylib.}


# color
proc ColorToFloat*(color: Color): ptr cfloat {.stdcall, importc, dynlib: dynlibraylib.}
proc ColorToInt*(color: Color): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc ColorToHSV*(color: Color): Vector3 {.stdcall, importc, dynlib: dynlibraylib.}
proc GetColor*(hexValue: cint): Color {.stdcall, importc, dynlib: dynlibraylib.}
proc Fade*(color: Color; alpha: cfloat): Color {.stdcall, importc, dynlib: dynlibraylib.}


# filesystem
proc TakeScreenshot*(fileName: cstring) {.stdcall, importc, dynlib: dynlibraylib.}
proc IsFileExtension*(fileName: cstring; ext: cstring): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc GetExtension*(fileName: cstring): cstring {.stdcall, importc, dynlib: dynlibraylib.}
proc GetFileName*(filePath: cstring): cstring {.stdcall, importc, dynlib: dynlibraylib.}
proc GetDirectoryPath*(fileName: cstring): cstring {.stdcall, importc, dynlib: dynlibraylib.}
proc GetWorkingDirectory*(): cstring {.stdcall, importc, dynlib: dynlibraylib.}
proc ChangeDirectory*(dir: cstring): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsFileDropped*(): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc GetDroppedFiles*(count: ptr cint): cstringArray {.stdcall, importc, dynlib: dynlibraylib.}
proc ClearDroppedFiles*() {.stdcall, importc, dynlib: dynlibraylib.}


# save
proc StorageSaveValue*(position: cint; value: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc StorageLoadValue*(position: cint): cint {.stdcall, importc, dynlib: dynlibraylib.}


# keyboard
proc IsKeyPressed*(key: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsKeyDown*(key: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsKeyReleased*(key: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsKeyUp*(key: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc GetKeyPressed*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc SetExitKey*(key: cint) {.stdcall, importc, dynlib: dynlibraylib.}


# mouse
proc IsMouseButtonPressed*(button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsMouseButtonDown*(button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsMouseButtonReleased*(button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc IsMouseButtonUp*(button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMouseX*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMouseY*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMousePosition*(): Vector2 {.stdcall, importc, dynlib: dynlibraylib.}
proc SetMousePosition*(position: Vector2) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetMouseScale*(scale: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMouseWheelMove*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMouseRay*(mousePosition: Vector2; camera: Camera): Ray {.stdcall, importc, dynlib: dynlibraylib.}


# camera
proc SetCameraMode*(camera: Camera; mode: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc UpdateCamera*(camera: ptr Camera) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetCameraPanControl*(panKey: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetCameraAltControl*(altKey: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetCameraSmoothZoomControl*(szKey: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetCameraMoveControls*(frontKey: cint; backKey: cint; rightKey: cint; leftKey: cint; upKey: cint; downKey: cint) {.stdcall, importc, dynlib: dynlibraylib.}


# 2d shapes
## pixels
proc DrawPixel*(posX: cint; posY: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawPixelV*(position: Vector2; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
## lines
proc DrawLine*(startPosX: cint; startPosY: cint; endPosX: cint; endPosY: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawLineV*(startPos: Vector2; endPos: Vector2; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawLineEx*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawLineBezier*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
## circles
proc DrawCircle*(centerX: cint; centerY: cint; radius: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawCircleGradient*(centerX: cint; centerY: cint; radius: cfloat; color1: Color; color2: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawCircleV*(center: Vector2; radius: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawCircleLines*(centerX: cint; centerY: cint; radius: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
## rectanles
proc DrawRectangle*(posX: cint; posY: cint; width: cint; height: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleV*(position: Vector2; size: Vector2; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleRec*(rec: Rectangle; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectanglePro*(rec: Rectangle; origin: Vector2; rotation: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleGradientV*(posX: cint; posY: cint; width: cint; height: cint; color1: Color; color2: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleGradientH*(posX: cint; posY: cint; width: cint; height: cint; color1: Color; color2: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleGradientEx*(rec: Rectangle; col1: Color; col2: Color; col3: Color; col4: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleLines*(posX: cint; posY: cint; width: cint; height: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawRectangleLinesEx*(rec: Rectangle; lineThick: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
## triangles
proc DrawTriangle*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawTriangleLines*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
## poly
proc DrawPoly*(center: Vector2; sides: cint; radius: cfloat; rotation: cfloat; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawPolyEx*(points: ptr Vector2; numPoints: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawPolyExLines*(points: ptr Vector2; numPoints: cint; color: Color) {.stdcall, importc, dynlib: dynlibraylib.}


# 2d collision
proc CheckCollisionRecs*(rec1: Rectangle; rec2: Rectangle): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc CheckCollisionCircles*(center1: Vector2; radius1: cfloat; center2: Vector2; radius2: cfloat): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc CheckCollisionCircleRec*(center: Vector2; radius: cfloat; rec: Rectangle): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc GetCollisionRec*(rec1: Rectangle; rec2: Rectangle): Rectangle {.stdcall, importc, dynlib: dynlibraylib.}
proc CheckCollisionPointRec*(point: Vector2; rec: Rectangle): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc CheckCollisionPointCircle*(point: Vector2; center: Vector2; radius: cfloat): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc CheckCollisionPointTriangle*(point: Vector2; p1: Vector2; p2: Vector2; p3: Vector2): bool {.stdcall, importc, dynlib: dynlibraylib.}


# images and textures
proc LoadImage*(fileName: cstring): Image {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadImageEx*(pixels: ptr Color; width: cint; height: cint): Image {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadImagePro*(data: pointer; width: cint; height: cint; format: cint): Image {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadImageRaw*(fileName: cstring; width: cint; height: cint; format: cint; headerSize: cint): Image {.stdcall, importc, dynlib: dynlibraylib.}
proc ExportImage*(fileName: cstring; image: Image) {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadTexture*(fileName: cstring): Texture2D {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadTextureFromImage*(image: Image): Texture2D {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadRenderTexture*(width: cint; height: cint): RenderTexture2D {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadImage*(image: Image) {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadTexture*(texture: Texture2D) {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadRenderTexture*(target: RenderTexture2D) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetImageData*(image: Image): ptr Color {.stdcall, importc, dynlib: dynlibraylib.}
proc GetPixelDataSize*(width: cint; height: cint; format: cint): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc GetTextureData*(texture: Texture2D): Image {.stdcall, importc, dynlib: dynlibraylib.}
proc UpdateTexture*(texture: Texture2D; pixels: pointer) {.stdcall, importc, dynlib: dynlibraylib.}
proc ImageCopy*(image: Image): Image {.stdcall, importc, dynlib: dynlibraylib.}
proc ImageToPOT*(image: ptr Image; fillColor: Color) {.stdcall, importc,
    dynlib: dynlibraylib.}
proc ImageFormat*(image: ptr Image; newFormat: cint) {.stdcall, importc,
    dynlib: dynlibraylib.}
proc ImageAlphaMask*(image: ptr Image; alphaMask: Image) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageAlphaClear*(image: ptr Image; color: Color; threshold: cfloat) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageAlphaCrop*(image: ptr Image; threshold: cfloat) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageAlphaPremultiply*(image: ptr Image) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageCrop*(image: ptr Image; crop: Rectangle) {.stdcall, importc,
    dynlib: dynlibraylib.}
proc ImageResize*(image: ptr Image; newWidth: cint; newHeight: cint) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageResizeNN*(image: ptr Image; newWidth: cint; newHeight: cint) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageMipmaps*(image: ptr Image) {.stdcall, importc,
                                   dynlib: dynlibraylib.}
proc ImageDither*(image: ptr Image; rBpp: cint; gBpp: cint; bBpp: cint; aBpp: cint) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc ImageText*(text: cstring; fontSize: cint; color: Color): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageTextEx*(font: SpriteFont; text: cstring; fontSize: cfloat; spacing: cint;
                 tint: Color): Image {.stdcall, importc,
                                    dynlib: dynlibraylib.}
proc ImageDraw*(dst: ptr Image; src: Image; srcRec: Rectangle; dstRec: Rectangle) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc ImageDrawRectangle*(dst: ptr Image; position: Vector2; rec: Rectangle; color: Color) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc ImageDrawText*(dst: ptr Image; position: Vector2; text: cstring; fontSize: cint;
                   color: Color) {.stdcall, importc,
                                 dynlib: dynlibraylib.}
proc ImageDrawTextEx*(dst: ptr Image; position: Vector2; font: SpriteFont;
                     text: cstring; fontSize: cfloat; spacing: cint; color: Color) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc ImageFlipVertical*(image: ptr Image) {.stdcall, importc,
                                        dynlib: dynlibraylib.}
proc ImageFlipHorizontal*(image: ptr Image) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageColorTint*(image: ptr Image; color: Color) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageColorInvert*(image: ptr Image) {.stdcall, importc,
                                       dynlib: dynlibraylib.}
proc ImageColorGrayscale*(image: ptr Image) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageColorContrast*(image: ptr Image; contrast: cfloat) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc ImageColorBrightness*(image: ptr Image; brightness: cint) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenImageColor*(width: cint; height: cint; color: Color): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenImageGradientV*(width: cint; height: cint; top: Color; bottom: Color): Image {.
    stdcall, importc, dynlib: dynlibraylib.}
proc GenImageGradientH*(width: cint; height: cint; left: Color; right: Color): Image {.
    stdcall, importc, dynlib: dynlibraylib.}
proc GenImageGradientRadial*(width: cint; height: cint; density: cfloat; inner: Color;
                            outer: Color): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenImageChecked*(width: cint; height: cint; checksX: cint; checksY: cint;
                     col1: Color; col2: Color): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenImageWhiteNoise*(width: cint; height: cint; factor: cfloat): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenImagePerlinNoise*(width: cint; height: cint; offsetX: cint; offsetY: cint;
                         scale: cfloat): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenImageCellular*(width: cint; height: cint; tileSize: cint): Image {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GenTextureMipmaps*(texture: ptr Texture2D) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc SetTextureFilter*(texture: Texture2D; filterMode: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetTextureWrap*(texture: Texture2D; wrapMode: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawTexture*(texture: Texture2D; posX: cint; posY: cint; tint: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawTextureV*(texture: Texture2D; position: Vector2; tint: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawTextureEx*(texture: Texture2D; position: Vector2; rotation: cfloat; scale: cfloat; tint: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawTextureRec*(texture: Texture2D; sourceRec: Rectangle; position: Vector2; tint: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawTexturePro*(texture: Texture2D; sourceRec: Rectangle; destRec: Rectangle; origin: Vector2; rotation: cfloat; tint: Color) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetDefaultFont*(): SpriteFont {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadSpriteFont*(fileName: cstring): SpriteFont {.stdcall,
    importc, dynlib: dynlibraylib.}
proc LoadSpriteFontEx*(fileName: cstring; fontSize: cint; charsCount: cint;
                      fontChars: ptr cint): SpriteFont {.stdcall,
    importc, dynlib: dynlibraylib.}
proc UnloadSpriteFont*(font: SpriteFont) {.stdcall, importc,
                                        dynlib: dynlibraylib.}
proc DrawFPS*(posX: cint; posY: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc DrawText*(text: cstring; posX: cint; posY: cint; fontSize: cint; color: Color) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc DrawTextEx*(font: SpriteFont; text: cstring; position: Vector2; fontSize: cfloat;
                spacing: cint; tint: Color) {.stdcall, importc,
    dynlib: dynlibraylib.}
proc MeasureText*(text: cstring; fontSize: cint): cint {.stdcall,
    importc, dynlib: dynlibraylib.}
proc MeasureTextEx*(font: SpriteFont; text: cstring; fontSize: cfloat; spacing: cint): Vector2 {.
    stdcall, importc, dynlib: dynlibraylib.}
proc FormatText*(text: cstring): cstring {.varargs, stdcall, importc,
                                       dynlib: dynlibraylib.}
proc SubText*(text: cstring; position: cint; length: cint): cstring {.stdcall,
    importc, dynlib: dynlibraylib.}
proc GetGlyphIndex*(font: SpriteFont; character: cint): cint {.stdcall,
    importc, dynlib: dynlibraylib.}

# shaders
proc LoadText*(fileName: cstring): cstring {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadShader*(vsFileName: cstring; fsFileName: cstring): Shader {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadShaderCode*(vsCode: cstring; fsCode: cstring): Shader {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadShader*(shader: Shader) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetShaderDefault*(): Shader {.stdcall, importc, dynlib: dynlibraylib.}
proc GetTextureDefault*(): Texture2D {.stdcall, importc, dynlib: dynlibraylib.}
proc GetShaderLocation*(shader: Shader; uniformName: cstring): cint {.stdcall, importc, dynlib: dynlibraylib.}
proc SetShaderValue*(shader: Shader; uniformLoc: cint; value: ptr cfloat; size: cint) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc SetShaderValuei*(shader: Shader; uniformLoc: cint; value: ptr cint; size: cint) {.
    stdcall, importc, dynlib: dynlibraylib.}
proc SetShaderValueMatrix*(shader: Shader; uniformLoc: cint; mat: Matrix) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc SetMatrixProjection*(proj: Matrix) {.stdcall, importc,
                                       dynlib: dynlibraylib.}
proc SetMatrixModelview*(view: Matrix) {.stdcall, importc,
                                      dynlib: dynlibraylib.}
proc GetMatrixModelview*(): Matrix {.stdcall, importc,
                                  dynlib: dynlibraylib.}
proc GenTextureCubemap*(shader: Shader; skyHDR: Texture2D; size: cint): Texture2D {.
    stdcall, importc, dynlib: dynlibraylib.}
proc GenTextureIrradiance*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.
    stdcall, importc, dynlib: dynlibraylib.}
proc GenTexturePrefilter*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.
    stdcall, importc, dynlib: dynlibraylib.}
proc GenTextureBRDF*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.
    stdcall, importc, dynlib: dynlibraylib.}
proc BeginShaderMode*(shader: Shader) {.stdcall, importc,
                                     dynlib: dynlibraylib.}
proc EndShaderMode*() {.stdcall, importc, dynlib: dynlibraylib.}
proc BeginBlendMode*(mode: cint) {.stdcall, importc,
                                dynlib: dynlibraylib.}
proc EndBlendMode*() {.stdcall, importc, dynlib: dynlibraylib.}

# vr
#[
proc GetVrDeviceInfo*(vrDeviceType: cint): VrDeviceInfo {.stdcall,
    importc, dynlib: dynlibraylib.}
proc InitVrSimulator*(info: VrDeviceInfo) {.stdcall, importc,
    dynlib: dynlibraylib.}
proc CloseVrSimulator*() {.stdcall, importc, dynlib: dynlibraylib.}
proc IsVrSimulatorReady*(): bool {.stdcall, importc,
                                dynlib: dynlibraylib.}
proc SetVrDistortionShader*(shader: Shader) {.stdcall,
    importc, dynlib: dynlibraylib.}
proc UpdateVrTracking*(camera: ptr Camera) {.stdcall, importc,
    dynlib: dynlibraylib.}
proc ToggleVrMode*() {.stdcall, importc, dynlib: dynlibraylib.}
proc BeginVrDrawing*() {.stdcall, importc, dynlib: dynlibraylib.}
proc EndVrDrawing*() {.stdcall, importc, dynlib: dynlibraylib.}
]#

# audio
proc InitAudioDevice*() {.stdcall, importc, dynlib: dynlibraylib.}
proc CloseAudioDevice*() {.stdcall, importc, dynlib: dynlibraylib.}
proc IsAudioDeviceReady*(): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc SetMasterVolume*(volume: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadWave*(fileName: cstring): Wave {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadWaveEx*(data: pointer; sampleCount: cint; sampleRate: cint; sampleSize: cint; channels: cint): Wave {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadSound*(fileName: cstring): Sound {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadSoundFromWave*(wave: Wave): Sound {.stdcall, importc, dynlib: dynlibraylib.}
proc PlaySound*(sound: Sound) {.stdcall, importc, dynlib: dynlibraylib.}
proc PauseSound*(sound: Sound) {.stdcall, importc, dynlib: dynlibraylib.}
proc ResumeSound*(sound: Sound) {.stdcall, importc, dynlib: dynlibraylib.}
proc StopSound*(sound: Sound) {.stdcall, importc, dynlib: dynlibraylib.}
proc UpdateSound*(sound: Sound; data: pointer; samplesCount: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadWave*(wave: Wave) {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadSound*(sound: Sound) {.stdcall, importc, dynlib: dynlibraylib.}
proc IsSoundPlaying*(sound: Sound): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc SetSoundVolume*(sound: Sound; volume: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetSoundPitch*(sound: Sound; pitch: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc WaveFormat*(wave: ptr Wave; sampleRate: cint; sampleSize: cint; channels: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc WaveCopy*(wave: Wave): Wave {.stdcall, importc, dynlib: dynlibraylib.}
proc WaveCrop*(wave: ptr Wave; initSample: cint; finalSample: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetWaveData*(wave: Wave): ptr cfloat {.stdcall, importc, dynlib: dynlibraylib.}
proc LoadMusicStream*(fileName: cstring): Music {.stdcall, importc, dynlib: dynlibraylib.}
proc UnloadMusicStream*(music: Music) {.stdcall, importc, dynlib: dynlibraylib.}
proc PlayMusicStream*(music: Music) {.stdcall, importc, dynlib: dynlibraylib.}
proc UpdateMusicStream*(music: Music) {.stdcall, importc, dynlib: dynlibraylib.}
proc StopMusicStream*(music: Music) {.stdcall, importc, dynlib: dynlibraylib.}
proc PauseMusicStream*(music: Music) {.stdcall, importc, dynlib: dynlibraylib.}
proc ResumeMusicStream*(music: Music) {.stdcall, importc, dynlib: dynlibraylib.}
proc IsMusicPlaying*(music: Music): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc SetMusicVolume*(music: Music; volume: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetMusicPitch*(music: Music; pitch: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetMusicLoopCount*(music: Music; count: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMusicTimeLength*(music: Music): cfloat {.stdcall, importc, dynlib: dynlibraylib.}
proc GetMusicTimePlayed*(music: Music): cfloat {.stdcall, importc, dynlib: dynlibraylib.}
proc InitAudioStream*(sampleRate: cuint; sampleSize: cuint; channels: cuint): AudioStream {.stdcall, importc, dynlib: dynlibraylib.}
proc UpdateAudioStream*(stream: AudioStream; data: pointer; samplesCount: cint) {.stdcall, importc, dynlib: dynlibraylib.}
proc CloseAudioStream*(stream: AudioStream) {.stdcall, importc, dynlib: dynlibraylib.}
proc IsAudioBufferProcessed*(stream: AudioStream): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc PlayAudioStream*(stream: AudioStream) {.stdcall, importc, dynlib: dynlibraylib.}
proc PauseAudioStream*(stream: AudioStream) {.stdcall, importc, dynlib: dynlibraylib.}
proc ResumeAudioStream*(stream: AudioStream) {.stdcall, importc, dynlib: dynlibraylib.}
proc IsAudioStreamPlaying*(stream: AudioStream): bool {.stdcall, importc, dynlib: dynlibraylib.}
proc StopAudioStream*(stream: AudioStream) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetAudioStreamVolume*(stream: AudioStream; volume: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}
proc SetAudioStreamPitch*(stream: AudioStream; pitch: cfloat) {.stdcall, importc, dynlib: dynlibraylib.}

# touch
#[
    proc GetTouchX*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
    proc GetTouchY*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
    proc GetTouchPosition*(index: cint): Vector2 {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc SetGesturesEnabled*(gestureFlags: cuint) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc IsGestureDetected*(gesture: cint): bool {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc GetGestureDetected*(): cint {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc GetTouchPointsCount*(): cint {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc GetGestureHoldDuration*(): cfloat {.stdcall, importc,
                                        dynlib: dynlibraylib.}
    proc GetGestureDragVector*(): Vector2 {.stdcall, importc,
                                        dynlib: dynlibraylib.}
    proc GetGestureDragAngle*(): cfloat {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc GetGesturePinchVector*(): Vector2 {.stdcall, importc,
                                        dynlib: dynlibraylib.}
    proc GetGesturePinchAngle*(): cfloat {.stdcall, importc,
                                        dynlib: dynlibraylib.}

]#

# gamepads
#[
    proc IsGamepadAvailable*(gamepad: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
    proc IsGamepadName*(gamepad: cint; name: cstring): bool {.stdcall, importc, dynlib: dynlibraylib.}
    proc GetGamepadName*(gamepad: cint): cstring {.stdcall, importc, dynlib: dynlibraylib.}
    proc IsGamepadButtonPressed*(gamepad: cint; button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
    proc IsGamepadButtonDown*(gamepad: cint; button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
    proc IsGamepadButtonReleased*(gamepad: cint; button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
    proc IsGamepadButtonUp*(gamepad: cint; button: cint): bool {.stdcall, importc, dynlib: dynlibraylib.}
    proc GetGamepadButtonPressed*(): cint {.stdcall, importc, dynlib: dynlibraylib.}
    proc GetGamepadAxisCount*(gamepad: cint): cint {.stdcall, importc, dynlib: dynlibraylib.}
    proc GetGamepadAxisMovement*(gamepad: cint; axis: cint): cfloat {.stdcall, importc, dynlib: dynlibraylib.}

]#

# 3d stuff will be ignored
#[ 
    proc Begin3dMode*(camera: Camera) {.stdcall, importc, dynlib: dynlibraylib.}
    proc End3dMode*() {.stdcall, importc, dynlib: dynlibraylib.}
    proc DrawLine3D*(startPos: Vector3; endPos: Vector3; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawCircle3D*(center: Vector3; radius: cfloat; rotationAxis: Vector3;
                    rotationAngle: cfloat; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawCube*(position: Vector3; width: cfloat; height: cfloat; length: cfloat;
                color: Color) {.stdcall, importc, dynlib: dynlibraylib.}
    proc DrawCubeV*(position: Vector3; size: Vector3; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawCubeWires*(position: Vector3; width: cfloat; height: cfloat; length: cfloat;
                    color: Color) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc DrawCubeTexture*(texture: Texture2D; position: Vector3; width: cfloat;
                        height: cfloat; length: cfloat; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawSphere*(centerPos: Vector3; radius: cfloat; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawSphereEx*(centerPos: Vector3; radius: cfloat; rings: cint; slices: cint;
                    color: Color) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc DrawSphereWires*(centerPos: Vector3; radius: cfloat; rings: cint; slices: cint;
                        color: Color) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc DrawCylinder*(position: Vector3; radiusTop: cfloat; radiusBottom: cfloat;
                    height: cfloat; slices: cint; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawCylinderWires*(position: Vector3; radiusTop: cfloat; radiusBottom: cfloat;
                        height: cfloat; slices: cint; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawPlane*(centerPos: Vector3; size: Vector2; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawRay*(ray: Ray; color: Color) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc DrawGrid*(slices: cint; spacing: cfloat) {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc DrawGizmo*(position: Vector3) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc LoadModel*(fileName: cstring): Model {.stdcall, importc,
                                            dynlib: dynlibraylib.}
    proc LoadModelFromMesh*(mesh: Mesh): Model {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc UnloadModel*(model: Model) {.stdcall, importc,
                                dynlib: dynlibraylib.}
    proc LoadMesh*(fileName: cstring): Mesh {.stdcall, importc,
                                        dynlib: dynlibraylib.}
    proc UnloadMesh*(mesh: ptr Mesh) {.stdcall, importc, dynlib: dynlibraylib.}
    proc ExportMesh*(fileName: cstring; mesh: Mesh) {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc MeshBoundingBox*(mesh: Mesh): BoundingBox {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc MeshTangents*(mesh: ptr Mesh) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc MeshBinormals*(mesh: ptr Mesh) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc GenMeshPlane*(width: cfloat; length: cfloat; resX: cint; resZ: cint): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GenMeshCube*(width: cfloat; height: cfloat; length: cfloat): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GenMeshSphere*(radius: cfloat; rings: cint; slices: cint): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GenMeshHemiSphere*(radius: cfloat; rings: cint; slices: cint): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GenMeshCylinder*(radius: cfloat; height: cfloat; slices: cint): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GenMeshTorus*(radius: cfloat; size: cfloat; radSeg: cint; sides: cint): Mesh {.
        stdcall, importc, dynlib: dynlibraylib.}
    proc GenMeshKnot*(radius: cfloat; size: cfloat; radSeg: cint; sides: cint): Mesh {.
        stdcall, importc, dynlib: dynlibraylib.}
    proc GenMeshHeightmap*(heightmap: Image; size: Vector3): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GenMeshCubicmap*(cubicmap: Image; cubeSize: Vector3): Mesh {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc LoadMaterial*(fileName: cstring): Material {.stdcall, importc,
        dynlib: dynlibraylib.}
    proc LoadMaterialDefault*(): Material {.stdcall, importc,
                                        dynlib: dynlibraylib.}
    proc UnloadMaterial*(material: Material) {.stdcall, importc,
                                            dynlib: dynlibraylib.}
    proc DrawModel*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawModelEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                    rotationAngle: cfloat; scale: Vector3; tint: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawModelWires*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.
        stdcall, importc, dynlib: dynlibraylib.}
    proc DrawModelWiresEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                        rotationAngle: cfloat; scale: Vector3; tint: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawBoundingBox*(box: BoundingBox; color: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc DrawBillboard*(camera: Camera; texture: Texture2D; center: Vector3; size: cfloat;
                    tint: Color) {.stdcall, importc,
                                    dynlib: dynlibraylib.}
    proc DrawBillboardRec*(camera: Camera; texture: Texture2D; sourceRec: Rectangle;
                        center: Vector3; size: cfloat; tint: Color) {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc CheckCollisionSpheres*(centerA: Vector3; radiusA: cfloat; centerB: Vector3;
                            radiusB: cfloat): bool {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc CheckCollisionBoxes*(box1: BoundingBox; box2: BoundingBox): bool {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc CheckCollisionBoxSphere*(box: BoundingBox; centerSphere: Vector3;
                                radiusSphere: cfloat): bool {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc CheckCollisionRaySphere*(ray: Ray; spherePosition: Vector3; sphereRadius: cfloat): bool {.
        stdcall, importc, dynlib: dynlibraylib.}
    proc CheckCollisionRaySphereEx*(ray: Ray; spherePosition: Vector3;
                                sphereRadius: cfloat; collisionPoint: ptr Vector3): bool {.
        stdcall, importc, dynlib: dynlibraylib.}
    proc CheckCollisionRayBox*(ray: Ray; box: BoundingBox): bool {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GetCollisionRayModel*(ray: Ray; model: ptr Model): RayHitInfo {.stdcall,
        importc, dynlib: dynlibraylib.}
    proc GetCollisionRayTriangle*(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3): RayHitInfo {.
        stdcall, importc, dynlib: dynlibraylib.}
    proc GetCollisionRayGround*(ray: Ray; groundHeight: cfloat): RayHitInfo {.stdcall,
        importc, dynlib: dynlibraylib.} 
]#
