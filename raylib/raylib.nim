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
  FLAG_SHOW_LOGO* = 1
  FLAG_FULLSCREEN_MODE* = 2
  FLAG_WINDOW_RESIZABLE* = 4
  FLAG_WINDOW_DECORATED* = 8
  FLAG_WINDOW_TRANSPARENT* = 16
  FLAG_MSAA_4X_HINT* = 32
  FLAG_VSYNC_HINT* = 64
  KEY_SPACE* = 32
  KEY_ESCAPE* = 256
  KEY_ENTER* = 257
  KEY_TAB* = 258
  KEY_BACKSPACE* = 259
  KEY_INSERT* = 260
  KEY_DELETE* = 261
  KEY_RIGHT* = 262
  KEY_LEFT* = 263
  KEY_DOWN* = 264
  KEY_UP* = 265
  KEY_PAGE_UP* = 266
  KEY_PAGE_DOWN* = 267
  KEY_HOME* = 268
  KEY_END* = 269
  KEY_CAPS_LOCK* = 280
  KEY_SCROLL_LOCK* = 281
  KEY_NUM_LOCK* = 282
  KEY_PRINT_SCREEN* = 283
  KEY_PAUSE* = 284
  KEY_F1* = 290
  KEY_F2* = 291
  KEY_F3* = 292
  KEY_F4* = 293
  KEY_F5* = 294
  KEY_F6* = 295
  KEY_F7* = 296
  KEY_F8* = 297
  KEY_F9* = 298
  KEY_F10* = 299
  KEY_F11* = 300
  KEY_F12* = 301
  KEY_LEFT_SHIFT* = 340
  KEY_LEFT_CONTROL* = 341
  KEY_LEFT_ALT* = 342
  KEY_RIGHT_SHIFT* = 344
  KEY_RIGHT_CONTROL* = 345
  KEY_RIGHT_ALT* = 346
  KEY_ZERO* = 48
  KEY_ONE* = 49
  KEY_TWO* = 50
  KEY_THREE* = 51
  KEY_FOUR* = 52
  KEY_FIVE* = 53
  KEY_SIX* = 54
  KEY_SEVEN* = 55
  KEY_EIGHT* = 56
  KEY_NINE* = 57
  KEY_A* = 65
  KEY_B* = 66
  KEY_C* = 67
  KEY_D* = 68
  KEY_E* = 69
  KEY_F* = 70
  KEY_G* = 71
  KEY_H* = 72
  KEY_I* = 73
  KEY_J* = 74
  KEY_K* = 75
  KEY_L* = 76
  KEY_M* = 77
  KEY_N* = 78
  KEY_O* = 79
  KEY_P* = 80
  KEY_Q* = 81
  KEY_R* = 82
  KEY_S* = 83
  KEY_T* = 84
  KEY_U* = 85
  KEY_V* = 86
  KEY_W* = 87
  KEY_X* = 88
  KEY_Y* = 89
  KEY_Z* = 90
  KEY_BACK* = 4
  KEY_MENU* = 82
  KEY_VOLUME_UP* = 24
  KEY_VOLUME_DOWN* = 25
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

  CameraType* {.size: sizeof(cint).} = enum
    CAMERA_PERSPECTIVE = 0, CAMERA_ORTHOGRAPHIC
  Camera* {.bycopy.} = object
    position*: Vector3
    target*: Vector3
    up*: Vector3
    fovy*: cfloat
    `type`*: CameraType

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

  LogType* {.size: sizeof(cint).} = enum
    LOG_INFO = 1, LOG_WARNING = 2, LOG_ERROR = 4, LOG_DEBUG = 8, LOG_OTHER = 16
  ShaderLocationIndex* {.size: sizeof(cint).} = enum
    LOC_VERTEX_POSITION = 0, LOC_VERTEX_TEXCOORD01, LOC_VERTEX_TEXCOORD02,
    LOC_VERTEX_NORMAL, LOC_VERTEX_TANGENT, LOC_VERTEX_COLOR, LOC_MATRIX_MVP,
    LOC_MATRIX_MODEL, LOC_MATRIX_VIEW, LOC_MATRIX_PROJECTION, LOC_VECTOR_VIEW,
    LOC_COLOR_DIFFUSE, LOC_COLOR_SPECULAR, LOC_COLOR_AMBIENT, LOC_MAP_ALBEDO,
    LOC_MAP_METALNESS, LOC_MAP_NORMAL, LOC_MAP_ROUGHNESS, LOC_MAP_OCCLUSION,
    LOC_MAP_EMISSION, LOC_MAP_HEIGHT, LOC_MAP_CUBEMAP, LOC_MAP_IRRADIANCE,
    LOC_MAP_PREFILTER, LOC_MAP_BRDF
  TexmapIndex* {.size: sizeof(cint).} = enum
    MAP_ALBEDO = 0, MAP_METALNESS = 1, MAP_NORMAL = 2, MAP_ROUGHNESS = 3, MAP_OCCLUSION,
    MAP_EMISSION, MAP_HEIGHT, MAP_CUBEMAP, MAP_IRRADIANCE, MAP_PREFILTER, MAP_BRDF
  PixelFormat* {.size: sizeof(cint).} = enum
    UNCOMPRESSED_GRAYSCALE = 1, UNCOMPRESSED_GRAY_ALPHA, UNCOMPRESSED_R5G6B5,
    UNCOMPRESSED_R8G8B8, UNCOMPRESSED_R5G5B5A1, UNCOMPRESSED_R4G4B4A4,
    UNCOMPRESSED_R8G8B8A8, UNCOMPRESSED_R32, UNCOMPRESSED_R32G32B32,
    UNCOMPRESSED_R32G32B32A32, COMPRESSED_DXT1_RGB, COMPRESSED_DXT1_RGBA,
    COMPRESSED_DXT3_RGBA, COMPRESSED_DXT5_RGBA, COMPRESSED_ETC1_RGB,
    COMPRESSED_ETC2_RGB, COMPRESSED_ETC2_EAC_RGBA, COMPRESSED_PVRT_RGB,
    COMPRESSED_PVRT_RGBA, COMPRESSED_ASTC_4x4_RGBA, COMPRESSED_ASTC_8x8_RGBA
  TextureFilterMode* {.size: sizeof(cint).} = enum
    FILTER_POINT = 0, FILTER_BILINEAR, FILTER_TRILINEAR, FILTER_ANISOTROPIC_4X,
    FILTER_ANISOTROPIC_8X, FILTER_ANISOTROPIC_16X
  TextureWrapMode* {.size: sizeof(cint).} = enum
    WRAP_REPEAT = 0, WRAP_CLAMP, WRAP_MIRROR
  BlendMode* {.size: sizeof(cint).} = enum
    BLEND_ALPHA = 0, BLEND_ADDITIVE, BLEND_MULTIPLIED
  Gestures* {.size: sizeof(cint).} = enum
    GESTURE_NONE = 0, GESTURE_TAP = 1, GESTURE_DOUBLETAP = 2, GESTURE_HOLD = 4,
    GESTURE_DRAG = 8, GESTURE_SWIPE_RIGHT = 16, GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64, GESTURE_SWIPE_DOWN = 128, GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512
  CameraMode* {.size: sizeof(cint).} = enum
    CAMERA_CUSTOM = 0, CAMERA_FREE, CAMERA_ORBITAL, CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON
  VrDeviceType* {.size: sizeof(cint).} = enum
    HMD_DEFAULT_DEVICE = 0, HMD_OCULUS_RIFT_DK2, HMD_OCULUS_RIFT_CV1, HMD_OCULUS_GO,
    HMD_VALVE_HTC_VIVE, HMD_SONY_PSVR













proc InitWindow*(width: cint; height: cint; title: cstring) {.stdcall,
    importc: "InitWindow", dynlib: dynlibraylib.}
proc CloseWindow*() {.stdcall, importc: "CloseWindow", dynlib: dynlibraylib.}
proc IsWindowReady*(): bool {.stdcall, importc: "IsWindowReady", dynlib: dynlibraylib.}
proc WindowShouldClose*(): bool {.stdcall, importc: "WindowShouldClose",
                               dynlib: dynlibraylib.}
proc IsWindowMinimized*(): bool {.stdcall, importc: "IsWindowMinimized",
                               dynlib: dynlibraylib.}
proc ToggleFullscreen*() {.stdcall, importc: "ToggleFullscreen", dynlib: dynlibraylib.}
proc SetWindowIcon*(image: Image) {.stdcall, importc: "SetWindowIcon",
                                 dynlib: dynlibraylib.}
proc SetWindowTitle*(title: cstring) {.stdcall, importc: "SetWindowTitle",
                                    dynlib: dynlibraylib.}
proc SetWindowPosition*(x: cint; y: cint) {.stdcall, importc: "SetWindowPosition",
                                       dynlib: dynlibraylib.}
proc SetWindowMonitor*(monitor: cint) {.stdcall, importc: "SetWindowMonitor",
                                     dynlib: dynlibraylib.}
proc SetWindowMinSize*(width: cint; height: cint) {.stdcall,
    importc: "SetWindowMinSize", dynlib: dynlibraylib.}
proc SetWindowSize*(width: cint; height: cint) {.stdcall, importc: "SetWindowSize",
    dynlib: dynlibraylib.}
proc GetScreenWidth*(): cint {.stdcall, importc: "GetScreenWidth",
                            dynlib: dynlibraylib.}
proc GetScreenHeight*(): cint {.stdcall, importc: "GetScreenHeight",
                             dynlib: dynlibraylib.}
proc ShowCursor*() {.stdcall, importc: "ShowCursor", dynlib: dynlibraylib.}
proc HideCursor*() {.stdcall, importc: "HideCursor", dynlib: dynlibraylib.}
proc IsCursorHidden*(): bool {.stdcall, importc: "IsCursorHidden",
                            dynlib: dynlibraylib.}
proc EnableCursor*() {.stdcall, importc: "EnableCursor", dynlib: dynlibraylib.}
proc DisableCursor*() {.stdcall, importc: "DisableCursor", dynlib: dynlibraylib.}
proc ClearBackground*(color: Color) {.stdcall, importc: "ClearBackground",
                                   dynlib: dynlibraylib.}
proc BeginDrawing*() {.stdcall, importc: "BeginDrawing", dynlib: dynlibraylib.}
proc EndDrawing*() {.stdcall, importc: "EndDrawing", dynlib: dynlibraylib.}
proc Begin2dMode*(camera: Camera2D) {.stdcall, importc: "Begin2dMode",
                                   dynlib: dynlibraylib.}
proc End2dMode*() {.stdcall, importc: "End2dMode", dynlib: dynlibraylib.}
proc Begin3dMode*(camera: Camera) {.stdcall, importc: "Begin3dMode",
                                 dynlib: dynlibraylib.}
proc End3dMode*() {.stdcall, importc: "End3dMode", dynlib: dynlibraylib.}
proc BeginTextureMode*(target: RenderTexture2D) {.stdcall,
    importc: "BeginTextureMode", dynlib: dynlibraylib.}
proc EndTextureMode*() {.stdcall, importc: "EndTextureMode", dynlib: dynlibraylib.}
proc GetMouseRay*(mousePosition: Vector2; camera: Camera): Ray {.stdcall,
    importc: "GetMouseRay", dynlib: dynlibraylib.}
proc GetWorldToScreen*(position: Vector3; camera: Camera): Vector2 {.stdcall,
    importc: "GetWorldToScreen", dynlib: dynlibraylib.}
proc GetCameraMatrix*(camera: Camera): Matrix {.stdcall, importc: "GetCameraMatrix",
    dynlib: dynlibraylib.}
proc SetTargetFPS*(fps: cint) {.stdcall, importc: "SetTargetFPS", dynlib: dynlibraylib.}
proc GetFPS*(): cint {.stdcall, importc: "GetFPS", dynlib: dynlibraylib.}
proc GetFrameTime*(): cfloat {.stdcall, importc: "GetFrameTime", dynlib: dynlibraylib.}
proc GetTime*(): cdouble {.stdcall, importc: "GetTime", dynlib: dynlibraylib.}
proc ColorToFloat*(color: Color): ptr cfloat {.stdcall, importc: "ColorToFloat",
    dynlib: dynlibraylib.}
proc ColorToInt*(color: Color): cint {.stdcall, importc: "ColorToInt",
                                   dynlib: dynlibraylib.}
proc ColorToHSV*(color: Color): Vector3 {.stdcall, importc: "ColorToHSV",
                                      dynlib: dynlibraylib.}
proc GetColor*(hexValue: cint): Color {.stdcall, importc: "GetColor",
                                    dynlib: dynlibraylib.}
proc Fade*(color: Color; alpha: cfloat): Color {.stdcall, importc: "Fade",
    dynlib: dynlibraylib.}
proc ShowLogo*() {.stdcall, importc: "ShowLogo", dynlib: dynlibraylib.}
proc SetConfigFlags*(flags: cuchar) {.stdcall, importc: "SetConfigFlags",
                                   dynlib: dynlibraylib.}
proc SetTraceLog*(types: cuchar) {.stdcall, importc: "SetTraceLog",
                                dynlib: dynlibraylib.}
proc TraceLog*(logType: cint; text: cstring) {.varargs, stdcall, importc: "TraceLog",
    dynlib: dynlibraylib.}
proc TakeScreenshot*(fileName: cstring) {.stdcall, importc: "TakeScreenshot",
                                       dynlib: dynlibraylib.}
proc GetRandomValue*(min: cint; max: cint): cint {.stdcall, importc: "GetRandomValue",
    dynlib: dynlibraylib.}
proc IsFileExtension*(fileName: cstring; ext: cstring): bool {.stdcall,
    importc: "IsFileExtension", dynlib: dynlibraylib.}
proc GetExtension*(fileName: cstring): cstring {.stdcall, importc: "GetExtension",
    dynlib: dynlibraylib.}
proc GetFileName*(filePath: cstring): cstring {.stdcall, importc: "GetFileName",
    dynlib: dynlibraylib.}
proc GetDirectoryPath*(fileName: cstring): cstring {.stdcall,
    importc: "GetDirectoryPath", dynlib: dynlibraylib.}
proc GetWorkingDirectory*(): cstring {.stdcall, importc: "GetWorkingDirectory",
                                    dynlib: dynlibraylib.}
proc ChangeDirectory*(dir: cstring): bool {.stdcall, importc: "ChangeDirectory",
                                        dynlib: dynlibraylib.}
proc IsFileDropped*(): bool {.stdcall, importc: "IsFileDropped", dynlib: dynlibraylib.}
proc GetDroppedFiles*(count: ptr cint): cstringArray {.stdcall,
    importc: "GetDroppedFiles", dynlib: dynlibraylib.}
proc ClearDroppedFiles*() {.stdcall, importc: "ClearDroppedFiles",
                          dynlib: dynlibraylib.}
proc StorageSaveValue*(position: cint; value: cint) {.stdcall,
    importc: "StorageSaveValue", dynlib: dynlibraylib.}
proc StorageLoadValue*(position: cint): cint {.stdcall, importc: "StorageLoadValue",
    dynlib: dynlibraylib.}
proc IsKeyPressed*(key: cint): bool {.stdcall, importc: "IsKeyPressed",
                                  dynlib: dynlibraylib.}
proc IsKeyDown*(key: cint): bool {.stdcall, importc: "IsKeyDown", dynlib: dynlibraylib.}
proc IsKeyReleased*(key: cint): bool {.stdcall, importc: "IsKeyReleased",
                                   dynlib: dynlibraylib.}
proc IsKeyUp*(key: cint): bool {.stdcall, importc: "IsKeyUp", dynlib: dynlibraylib.}
proc GetKeyPressed*(): cint {.stdcall, importc: "GetKeyPressed", dynlib: dynlibraylib.}
proc SetExitKey*(key: cint) {.stdcall, importc: "SetExitKey", dynlib: dynlibraylib.}
proc IsGamepadAvailable*(gamepad: cint): bool {.stdcall,
    importc: "IsGamepadAvailable", dynlib: dynlibraylib.}
proc IsGamepadName*(gamepad: cint; name: cstring): bool {.stdcall,
    importc: "IsGamepadName", dynlib: dynlibraylib.}
proc GetGamepadName*(gamepad: cint): cstring {.stdcall, importc: "GetGamepadName",
    dynlib: dynlibraylib.}
proc IsGamepadButtonPressed*(gamepad: cint; button: cint): bool {.stdcall,
    importc: "IsGamepadButtonPressed", dynlib: dynlibraylib.}
proc IsGamepadButtonDown*(gamepad: cint; button: cint): bool {.stdcall,
    importc: "IsGamepadButtonDown", dynlib: dynlibraylib.}
proc IsGamepadButtonReleased*(gamepad: cint; button: cint): bool {.stdcall,
    importc: "IsGamepadButtonReleased", dynlib: dynlibraylib.}
proc IsGamepadButtonUp*(gamepad: cint; button: cint): bool {.stdcall,
    importc: "IsGamepadButtonUp", dynlib: dynlibraylib.}
proc GetGamepadButtonPressed*(): cint {.stdcall, importc: "GetGamepadButtonPressed",
                                     dynlib: dynlibraylib.}
proc GetGamepadAxisCount*(gamepad: cint): cint {.stdcall,
    importc: "GetGamepadAxisCount", dynlib: dynlibraylib.}
proc GetGamepadAxisMovement*(gamepad: cint; axis: cint): cfloat {.stdcall,
    importc: "GetGamepadAxisMovement", dynlib: dynlibraylib.}
proc IsMouseButtonPressed*(button: cint): bool {.stdcall,
    importc: "IsMouseButtonPressed", dynlib: dynlibraylib.}
proc IsMouseButtonDown*(button: cint): bool {.stdcall, importc: "IsMouseButtonDown",
    dynlib: dynlibraylib.}
proc IsMouseButtonReleased*(button: cint): bool {.stdcall,
    importc: "IsMouseButtonReleased", dynlib: dynlibraylib.}
proc IsMouseButtonUp*(button: cint): bool {.stdcall, importc: "IsMouseButtonUp",
                                        dynlib: dynlibraylib.}
proc GetMouseX*(): cint {.stdcall, importc: "GetMouseX", dynlib: dynlibraylib.}
proc GetMouseY*(): cint {.stdcall, importc: "GetMouseY", dynlib: dynlibraylib.}
proc GetMousePosition*(): Vector2 {.stdcall, importc: "GetMousePosition",
                                 dynlib: dynlibraylib.}
proc SetMousePosition*(position: Vector2) {.stdcall, importc: "SetMousePosition",
    dynlib: dynlibraylib.}
proc SetMouseScale*(scale: cfloat) {.stdcall, importc: "SetMouseScale",
                                  dynlib: dynlibraylib.}
proc GetMouseWheelMove*(): cint {.stdcall, importc: "GetMouseWheelMove",
                               dynlib: dynlibraylib.}
proc GetTouchX*(): cint {.stdcall, importc: "GetTouchX", dynlib: dynlibraylib.}
proc GetTouchY*(): cint {.stdcall, importc: "GetTouchY", dynlib: dynlibraylib.}
proc GetTouchPosition*(index: cint): Vector2 {.stdcall, importc: "GetTouchPosition",
    dynlib: dynlibraylib.}
proc SetGesturesEnabled*(gestureFlags: cuint) {.stdcall,
    importc: "SetGesturesEnabled", dynlib: dynlibraylib.}
proc IsGestureDetected*(gesture: cint): bool {.stdcall, importc: "IsGestureDetected",
    dynlib: dynlibraylib.}
proc GetGestureDetected*(): cint {.stdcall, importc: "GetGestureDetected",
                                dynlib: dynlibraylib.}
proc GetTouchPointsCount*(): cint {.stdcall, importc: "GetTouchPointsCount",
                                 dynlib: dynlibraylib.}
proc GetGestureHoldDuration*(): cfloat {.stdcall, importc: "GetGestureHoldDuration",
                                      dynlib: dynlibraylib.}
proc GetGestureDragVector*(): Vector2 {.stdcall, importc: "GetGestureDragVector",
                                     dynlib: dynlibraylib.}
proc GetGestureDragAngle*(): cfloat {.stdcall, importc: "GetGestureDragAngle",
                                   dynlib: dynlibraylib.}
proc GetGesturePinchVector*(): Vector2 {.stdcall, importc: "GetGesturePinchVector",
                                      dynlib: dynlibraylib.}
proc GetGesturePinchAngle*(): cfloat {.stdcall, importc: "GetGesturePinchAngle",
                                    dynlib: dynlibraylib.}
proc SetCameraMode*(camera: Camera; mode: cint) {.stdcall, importc: "SetCameraMode",
    dynlib: dynlibraylib.}
proc UpdateCamera*(camera: ptr Camera) {.stdcall, importc: "UpdateCamera",
                                     dynlib: dynlibraylib.}
proc SetCameraPanControl*(panKey: cint) {.stdcall, importc: "SetCameraPanControl",
                                       dynlib: dynlibraylib.}
proc SetCameraAltControl*(altKey: cint) {.stdcall, importc: "SetCameraAltControl",
                                       dynlib: dynlibraylib.}
proc SetCameraSmoothZoomControl*(szKey: cint) {.stdcall,
    importc: "SetCameraSmoothZoomControl", dynlib: dynlibraylib.}
proc SetCameraMoveControls*(frontKey: cint; backKey: cint; rightKey: cint;
                           leftKey: cint; upKey: cint; downKey: cint) {.stdcall,
    importc: "SetCameraMoveControls", dynlib: dynlibraylib.}
proc DrawPixel*(posX: cint; posY: cint; color: Color) {.stdcall, importc: "DrawPixel",
    dynlib: dynlibraylib.}
proc DrawPixelV*(position: Vector2; color: Color) {.stdcall, importc: "DrawPixelV",
    dynlib: dynlibraylib.}
proc DrawLine*(startPosX: cint; startPosY: cint; endPosX: cint; endPosY: cint;
              color: Color) {.stdcall, importc: "DrawLine", dynlib: dynlibraylib.}
proc DrawLineV*(startPos: Vector2; endPos: Vector2; color: Color) {.stdcall,
    importc: "DrawLineV", dynlib: dynlibraylib.}
proc DrawLineEx*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.
    stdcall, importc: "DrawLineEx", dynlib: dynlibraylib.}
proc DrawLineBezier*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.
    stdcall, importc: "DrawLineBezier", dynlib: dynlibraylib.}
proc DrawCircle*(centerX: cint; centerY: cint; radius: cfloat; color: Color) {.stdcall,
    importc: "DrawCircle", dynlib: dynlibraylib.}
proc DrawCircleGradient*(centerX: cint; centerY: cint; radius: cfloat; color1: Color;
                        color2: Color) {.stdcall, importc: "DrawCircleGradient",
                                       dynlib: dynlibraylib.}
proc DrawCircleV*(center: Vector2; radius: cfloat; color: Color) {.stdcall,
    importc: "DrawCircleV", dynlib: dynlibraylib.}
proc DrawCircleLines*(centerX: cint; centerY: cint; radius: cfloat; color: Color) {.
    stdcall, importc: "DrawCircleLines", dynlib: dynlibraylib.}
proc DrawRectangle*(posX: cint; posY: cint; width: cint; height: cint; color: Color) {.
    stdcall, importc: "DrawRectangle", dynlib: dynlibraylib.}
proc DrawRectangleV*(position: Vector2; size: Vector2; color: Color) {.stdcall,
    importc: "DrawRectangleV", dynlib: dynlibraylib.}
proc DrawRectangleRec*(rec: Rectangle; color: Color) {.stdcall,
    importc: "DrawRectangleRec", dynlib: dynlibraylib.}
proc DrawRectanglePro*(rec: Rectangle; origin: Vector2; rotation: cfloat; color: Color) {.
    stdcall, importc: "DrawRectanglePro", dynlib: dynlibraylib.}
proc DrawRectangleGradientV*(posX: cint; posY: cint; width: cint; height: cint;
                            color1: Color; color2: Color) {.stdcall,
    importc: "DrawRectangleGradientV", dynlib: dynlibraylib.}
proc DrawRectangleGradientH*(posX: cint; posY: cint; width: cint; height: cint;
                            color1: Color; color2: Color) {.stdcall,
    importc: "DrawRectangleGradientH", dynlib: dynlibraylib.}
proc DrawRectangleGradientEx*(rec: Rectangle; col1: Color; col2: Color; col3: Color;
                             col4: Color) {.stdcall,
    importc: "DrawRectangleGradientEx", dynlib: dynlibraylib.}
proc DrawRectangleLines*(posX: cint; posY: cint; width: cint; height: cint; color: Color) {.
    stdcall, importc: "DrawRectangleLines", dynlib: dynlibraylib.}
proc DrawRectangleLinesEx*(rec: Rectangle; lineThick: cint; color: Color) {.stdcall,
    importc: "DrawRectangleLinesEx", dynlib: dynlibraylib.}
proc DrawTriangle*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.stdcall,
    importc: "DrawTriangle", dynlib: dynlibraylib.}
proc DrawTriangleLines*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.stdcall,
    importc: "DrawTriangleLines", dynlib: dynlibraylib.}
proc DrawPoly*(center: Vector2; sides: cint; radius: cfloat; rotation: cfloat;
              color: Color) {.stdcall, importc: "DrawPoly", dynlib: dynlibraylib.}
proc DrawPolyEx*(points: ptr Vector2; numPoints: cint; color: Color) {.stdcall,
    importc: "DrawPolyEx", dynlib: dynlibraylib.}
proc DrawPolyExLines*(points: ptr Vector2; numPoints: cint; color: Color) {.stdcall,
    importc: "DrawPolyExLines", dynlib: dynlibraylib.}
proc CheckCollisionRecs*(rec1: Rectangle; rec2: Rectangle): bool {.stdcall,
    importc: "CheckCollisionRecs", dynlib: dynlibraylib.}
proc CheckCollisionCircles*(center1: Vector2; radius1: cfloat; center2: Vector2;
                           radius2: cfloat): bool {.stdcall,
    importc: "CheckCollisionCircles", dynlib: dynlibraylib.}
proc CheckCollisionCircleRec*(center: Vector2; radius: cfloat; rec: Rectangle): bool {.
    stdcall, importc: "CheckCollisionCircleRec", dynlib: dynlibraylib.}
proc GetCollisionRec*(rec1: Rectangle; rec2: Rectangle): Rectangle {.stdcall,
    importc: "GetCollisionRec", dynlib: dynlibraylib.}
proc CheckCollisionPointRec*(point: Vector2; rec: Rectangle): bool {.stdcall,
    importc: "CheckCollisionPointRec", dynlib: dynlibraylib.}
proc CheckCollisionPointCircle*(point: Vector2; center: Vector2; radius: cfloat): bool {.
    stdcall, importc: "CheckCollisionPointCircle", dynlib: dynlibraylib.}
proc CheckCollisionPointTriangle*(point: Vector2; p1: Vector2; p2: Vector2; p3: Vector2): bool {.
    stdcall, importc: "CheckCollisionPointTriangle", dynlib: dynlibraylib.}
proc LoadImage*(fileName: cstring): Image {.stdcall, importc: "LoadImage",
                                        dynlib: dynlibraylib.}
proc LoadImageEx*(pixels: ptr Color; width: cint; height: cint): Image {.stdcall,
    importc: "LoadImageEx", dynlib: dynlibraylib.}
proc LoadImagePro*(data: pointer; width: cint; height: cint; format: cint): Image {.
    stdcall, importc: "LoadImagePro", dynlib: dynlibraylib.}
proc LoadImageRaw*(fileName: cstring; width: cint; height: cint; format: cint;
                  headerSize: cint): Image {.stdcall, importc: "LoadImageRaw",
    dynlib: dynlibraylib.}
proc ExportImage*(fileName: cstring; image: Image) {.stdcall, importc: "ExportImage",
    dynlib: dynlibraylib.}
proc LoadTexture*(fileName: cstring): Texture2D {.stdcall, importc: "LoadTexture",
    dynlib: dynlibraylib.}
proc LoadTextureFromImage*(image: Image): Texture2D {.stdcall,
    importc: "LoadTextureFromImage", dynlib: dynlibraylib.}
proc LoadRenderTexture*(width: cint; height: cint): RenderTexture2D {.stdcall,
    importc: "LoadRenderTexture", dynlib: dynlibraylib.}
proc UnloadImage*(image: Image) {.stdcall, importc: "UnloadImage",
                               dynlib: dynlibraylib.}
proc UnloadTexture*(texture: Texture2D) {.stdcall, importc: "UnloadTexture",
                                       dynlib: dynlibraylib.}
proc UnloadRenderTexture*(target: RenderTexture2D) {.stdcall,
    importc: "UnloadRenderTexture", dynlib: dynlibraylib.}
proc GetImageData*(image: Image): ptr Color {.stdcall, importc: "GetImageData",
    dynlib: dynlibraylib.}
proc GetPixelDataSize*(width: cint; height: cint; format: cint): cint {.stdcall,
    importc: "GetPixelDataSize", dynlib: dynlibraylib.}
proc GetTextureData*(texture: Texture2D): Image {.stdcall, importc: "GetTextureData",
    dynlib: dynlibraylib.}
proc UpdateTexture*(texture: Texture2D; pixels: pointer) {.stdcall,
    importc: "UpdateTexture", dynlib: dynlibraylib.}
proc ImageCopy*(image: Image): Image {.stdcall, importc: "ImageCopy",
                                   dynlib: dynlibraylib.}
proc ImageToPOT*(image: ptr Image; fillColor: Color) {.stdcall, importc: "ImageToPOT",
    dynlib: dynlibraylib.}
proc ImageFormat*(image: ptr Image; newFormat: cint) {.stdcall, importc: "ImageFormat",
    dynlib: dynlibraylib.}
proc ImageAlphaMask*(image: ptr Image; alphaMask: Image) {.stdcall,
    importc: "ImageAlphaMask", dynlib: dynlibraylib.}
proc ImageAlphaClear*(image: ptr Image; color: Color; threshold: cfloat) {.stdcall,
    importc: "ImageAlphaClear", dynlib: dynlibraylib.}
proc ImageAlphaCrop*(image: ptr Image; threshold: cfloat) {.stdcall,
    importc: "ImageAlphaCrop", dynlib: dynlibraylib.}
proc ImageAlphaPremultiply*(image: ptr Image) {.stdcall,
    importc: "ImageAlphaPremultiply", dynlib: dynlibraylib.}
proc ImageCrop*(image: ptr Image; crop: Rectangle) {.stdcall, importc: "ImageCrop",
    dynlib: dynlibraylib.}
proc ImageResize*(image: ptr Image; newWidth: cint; newHeight: cint) {.stdcall,
    importc: "ImageResize", dynlib: dynlibraylib.}
proc ImageResizeNN*(image: ptr Image; newWidth: cint; newHeight: cint) {.stdcall,
    importc: "ImageResizeNN", dynlib: dynlibraylib.}
proc ImageMipmaps*(image: ptr Image) {.stdcall, importc: "ImageMipmaps",
                                   dynlib: dynlibraylib.}
proc ImageDither*(image: ptr Image; rBpp: cint; gBpp: cint; bBpp: cint; aBpp: cint) {.
    stdcall, importc: "ImageDither", dynlib: dynlibraylib.}
proc ImageText*(text: cstring; fontSize: cint; color: Color): Image {.stdcall,
    importc: "ImageText", dynlib: dynlibraylib.}
proc ImageTextEx*(font: SpriteFont; text: cstring; fontSize: cfloat; spacing: cint;
                 tint: Color): Image {.stdcall, importc: "ImageTextEx",
                                    dynlib: dynlibraylib.}
proc ImageDraw*(dst: ptr Image; src: Image; srcRec: Rectangle; dstRec: Rectangle) {.
    stdcall, importc: "ImageDraw", dynlib: dynlibraylib.}
proc ImageDrawRectangle*(dst: ptr Image; position: Vector2; rec: Rectangle; color: Color) {.
    stdcall, importc: "ImageDrawRectangle", dynlib: dynlibraylib.}
proc ImageDrawText*(dst: ptr Image; position: Vector2; text: cstring; fontSize: cint;
                   color: Color) {.stdcall, importc: "ImageDrawText",
                                 dynlib: dynlibraylib.}
proc ImageDrawTextEx*(dst: ptr Image; position: Vector2; font: SpriteFont;
                     text: cstring; fontSize: cfloat; spacing: cint; color: Color) {.
    stdcall, importc: "ImageDrawTextEx", dynlib: dynlibraylib.}
proc ImageFlipVertical*(image: ptr Image) {.stdcall, importc: "ImageFlipVertical",
                                        dynlib: dynlibraylib.}
proc ImageFlipHorizontal*(image: ptr Image) {.stdcall,
    importc: "ImageFlipHorizontal", dynlib: dynlibraylib.}
proc ImageColorTint*(image: ptr Image; color: Color) {.stdcall,
    importc: "ImageColorTint", dynlib: dynlibraylib.}
proc ImageColorInvert*(image: ptr Image) {.stdcall, importc: "ImageColorInvert",
                                       dynlib: dynlibraylib.}
proc ImageColorGrayscale*(image: ptr Image) {.stdcall,
    importc: "ImageColorGrayscale", dynlib: dynlibraylib.}
proc ImageColorContrast*(image: ptr Image; contrast: cfloat) {.stdcall,
    importc: "ImageColorContrast", dynlib: dynlibraylib.}
proc ImageColorBrightness*(image: ptr Image; brightness: cint) {.stdcall,
    importc: "ImageColorBrightness", dynlib: dynlibraylib.}
proc GenImageColor*(width: cint; height: cint; color: Color): Image {.stdcall,
    importc: "GenImageColor", dynlib: dynlibraylib.}
proc GenImageGradientV*(width: cint; height: cint; top: Color; bottom: Color): Image {.
    stdcall, importc: "GenImageGradientV", dynlib: dynlibraylib.}
proc GenImageGradientH*(width: cint; height: cint; left: Color; right: Color): Image {.
    stdcall, importc: "GenImageGradientH", dynlib: dynlibraylib.}
proc GenImageGradientRadial*(width: cint; height: cint; density: cfloat; inner: Color;
                            outer: Color): Image {.stdcall,
    importc: "GenImageGradientRadial", dynlib: dynlibraylib.}
proc GenImageChecked*(width: cint; height: cint; checksX: cint; checksY: cint;
                     col1: Color; col2: Color): Image {.stdcall,
    importc: "GenImageChecked", dynlib: dynlibraylib.}
proc GenImageWhiteNoise*(width: cint; height: cint; factor: cfloat): Image {.stdcall,
    importc: "GenImageWhiteNoise", dynlib: dynlibraylib.}
proc GenImagePerlinNoise*(width: cint; height: cint; offsetX: cint; offsetY: cint;
                         scale: cfloat): Image {.stdcall,
    importc: "GenImagePerlinNoise", dynlib: dynlibraylib.}
proc GenImageCellular*(width: cint; height: cint; tileSize: cint): Image {.stdcall,
    importc: "GenImageCellular", dynlib: dynlibraylib.}
proc GenTextureMipmaps*(texture: ptr Texture2D) {.stdcall,
    importc: "GenTextureMipmaps", dynlib: dynlibraylib.}
proc SetTextureFilter*(texture: Texture2D; filterMode: cint) {.stdcall,
    importc: "SetTextureFilter", dynlib: dynlibraylib.}
proc SetTextureWrap*(texture: Texture2D; wrapMode: cint) {.stdcall,
    importc: "SetTextureWrap", dynlib: dynlibraylib.}
proc DrawTexture*(texture: Texture2D; posX: cint; posY: cint; tint: Color) {.stdcall,
    importc: "DrawTexture", dynlib: dynlibraylib.}
proc DrawTextureV*(texture: Texture2D; position: Vector2; tint: Color) {.stdcall,
    importc: "DrawTextureV", dynlib: dynlibraylib.}
proc DrawTextureEx*(texture: Texture2D; position: Vector2; rotation: cfloat;
                   scale: cfloat; tint: Color) {.stdcall, importc: "DrawTextureEx",
    dynlib: dynlibraylib.}
proc DrawTextureRec*(texture: Texture2D; sourceRec: Rectangle; position: Vector2;
                    tint: Color) {.stdcall, importc: "DrawTextureRec",
                                 dynlib: dynlibraylib.}
proc DrawTexturePro*(texture: Texture2D; sourceRec: Rectangle; destRec: Rectangle;
                    origin: Vector2; rotation: cfloat; tint: Color) {.stdcall,
    importc: "DrawTexturePro", dynlib: dynlibraylib.}
proc GetDefaultFont*(): SpriteFont {.stdcall, importc: "GetDefaultFont",
                                  dynlib: dynlibraylib.}
proc LoadSpriteFont*(fileName: cstring): SpriteFont {.stdcall,
    importc: "LoadSpriteFont", dynlib: dynlibraylib.}
proc LoadSpriteFontEx*(fileName: cstring; fontSize: cint; charsCount: cint;
                      fontChars: ptr cint): SpriteFont {.stdcall,
    importc: "LoadSpriteFontEx", dynlib: dynlibraylib.}
proc UnloadSpriteFont*(font: SpriteFont) {.stdcall, importc: "UnloadSpriteFont",
                                        dynlib: dynlibraylib.}
proc DrawFPS*(posX: cint; posY: cint) {.stdcall, importc: "DrawFPS",
                                   dynlib: dynlibraylib.}
proc DrawText*(text: cstring; posX: cint; posY: cint; fontSize: cint; color: Color) {.
    stdcall, importc: "DrawText", dynlib: dynlibraylib.}
proc DrawTextEx*(font: SpriteFont; text: cstring; position: Vector2; fontSize: cfloat;
                spacing: cint; tint: Color) {.stdcall, importc: "DrawTextEx",
    dynlib: dynlibraylib.}
proc MeasureText*(text: cstring; fontSize: cint): cint {.stdcall,
    importc: "MeasureText", dynlib: dynlibraylib.}
proc MeasureTextEx*(font: SpriteFont; text: cstring; fontSize: cfloat; spacing: cint): Vector2 {.
    stdcall, importc: "MeasureTextEx", dynlib: dynlibraylib.}
proc FormatText*(text: cstring): cstring {.varargs, stdcall, importc: "FormatText",
                                       dynlib: dynlibraylib.}
proc SubText*(text: cstring; position: cint; length: cint): cstring {.stdcall,
    importc: "SubText", dynlib: dynlibraylib.}
proc GetGlyphIndex*(font: SpriteFont; character: cint): cint {.stdcall,
    importc: "GetGlyphIndex", dynlib: dynlibraylib.}
proc DrawLine3D*(startPos: Vector3; endPos: Vector3; color: Color) {.stdcall,
    importc: "DrawLine3D", dynlib: dynlibraylib.}
proc DrawCircle3D*(center: Vector3; radius: cfloat; rotationAxis: Vector3;
                  rotationAngle: cfloat; color: Color) {.stdcall,
    importc: "DrawCircle3D", dynlib: dynlibraylib.}
proc DrawCube*(position: Vector3; width: cfloat; height: cfloat; length: cfloat;
              color: Color) {.stdcall, importc: "DrawCube", dynlib: dynlibraylib.}
proc DrawCubeV*(position: Vector3; size: Vector3; color: Color) {.stdcall,
    importc: "DrawCubeV", dynlib: dynlibraylib.}
proc DrawCubeWires*(position: Vector3; width: cfloat; height: cfloat; length: cfloat;
                   color: Color) {.stdcall, importc: "DrawCubeWires",
                                 dynlib: dynlibraylib.}
proc DrawCubeTexture*(texture: Texture2D; position: Vector3; width: cfloat;
                     height: cfloat; length: cfloat; color: Color) {.stdcall,
    importc: "DrawCubeTexture", dynlib: dynlibraylib.}
proc DrawSphere*(centerPos: Vector3; radius: cfloat; color: Color) {.stdcall,
    importc: "DrawSphere", dynlib: dynlibraylib.}
proc DrawSphereEx*(centerPos: Vector3; radius: cfloat; rings: cint; slices: cint;
                  color: Color) {.stdcall, importc: "DrawSphereEx",
                                dynlib: dynlibraylib.}
proc DrawSphereWires*(centerPos: Vector3; radius: cfloat; rings: cint; slices: cint;
                     color: Color) {.stdcall, importc: "DrawSphereWires",
                                   dynlib: dynlibraylib.}
proc DrawCylinder*(position: Vector3; radiusTop: cfloat; radiusBottom: cfloat;
                  height: cfloat; slices: cint; color: Color) {.stdcall,
    importc: "DrawCylinder", dynlib: dynlibraylib.}
proc DrawCylinderWires*(position: Vector3; radiusTop: cfloat; radiusBottom: cfloat;
                       height: cfloat; slices: cint; color: Color) {.stdcall,
    importc: "DrawCylinderWires", dynlib: dynlibraylib.}
proc DrawPlane*(centerPos: Vector3; size: Vector2; color: Color) {.stdcall,
    importc: "DrawPlane", dynlib: dynlibraylib.}
proc DrawRay*(ray: Ray; color: Color) {.stdcall, importc: "DrawRay",
                                   dynlib: dynlibraylib.}
proc DrawGrid*(slices: cint; spacing: cfloat) {.stdcall, importc: "DrawGrid",
    dynlib: dynlibraylib.}
proc DrawGizmo*(position: Vector3) {.stdcall, importc: "DrawGizmo",
                                  dynlib: dynlibraylib.}
proc LoadModel*(fileName: cstring): Model {.stdcall, importc: "LoadModel",
                                        dynlib: dynlibraylib.}
proc LoadModelFromMesh*(mesh: Mesh): Model {.stdcall, importc: "LoadModelFromMesh",
    dynlib: dynlibraylib.}
proc UnloadModel*(model: Model) {.stdcall, importc: "UnloadModel",
                               dynlib: dynlibraylib.}
proc LoadMesh*(fileName: cstring): Mesh {.stdcall, importc: "LoadMesh",
                                      dynlib: dynlibraylib.}
proc UnloadMesh*(mesh: ptr Mesh) {.stdcall, importc: "UnloadMesh", dynlib: dynlibraylib.}
proc ExportMesh*(fileName: cstring; mesh: Mesh) {.stdcall, importc: "ExportMesh",
    dynlib: dynlibraylib.}
proc MeshBoundingBox*(mesh: Mesh): BoundingBox {.stdcall, importc: "MeshBoundingBox",
    dynlib: dynlibraylib.}
proc MeshTangents*(mesh: ptr Mesh) {.stdcall, importc: "MeshTangents",
                                 dynlib: dynlibraylib.}
proc MeshBinormals*(mesh: ptr Mesh) {.stdcall, importc: "MeshBinormals",
                                  dynlib: dynlibraylib.}
proc GenMeshPlane*(width: cfloat; length: cfloat; resX: cint; resZ: cint): Mesh {.stdcall,
    importc: "GenMeshPlane", dynlib: dynlibraylib.}
proc GenMeshCube*(width: cfloat; height: cfloat; length: cfloat): Mesh {.stdcall,
    importc: "GenMeshCube", dynlib: dynlibraylib.}
proc GenMeshSphere*(radius: cfloat; rings: cint; slices: cint): Mesh {.stdcall,
    importc: "GenMeshSphere", dynlib: dynlibraylib.}
proc GenMeshHemiSphere*(radius: cfloat; rings: cint; slices: cint): Mesh {.stdcall,
    importc: "GenMeshHemiSphere", dynlib: dynlibraylib.}
proc GenMeshCylinder*(radius: cfloat; height: cfloat; slices: cint): Mesh {.stdcall,
    importc: "GenMeshCylinder", dynlib: dynlibraylib.}
proc GenMeshTorus*(radius: cfloat; size: cfloat; radSeg: cint; sides: cint): Mesh {.
    stdcall, importc: "GenMeshTorus", dynlib: dynlibraylib.}
proc GenMeshKnot*(radius: cfloat; size: cfloat; radSeg: cint; sides: cint): Mesh {.
    stdcall, importc: "GenMeshKnot", dynlib: dynlibraylib.}
proc GenMeshHeightmap*(heightmap: Image; size: Vector3): Mesh {.stdcall,
    importc: "GenMeshHeightmap", dynlib: dynlibraylib.}
proc GenMeshCubicmap*(cubicmap: Image; cubeSize: Vector3): Mesh {.stdcall,
    importc: "GenMeshCubicmap", dynlib: dynlibraylib.}
proc LoadMaterial*(fileName: cstring): Material {.stdcall, importc: "LoadMaterial",
    dynlib: dynlibraylib.}
proc LoadMaterialDefault*(): Material {.stdcall, importc: "LoadMaterialDefault",
                                     dynlib: dynlibraylib.}
proc UnloadMaterial*(material: Material) {.stdcall, importc: "UnloadMaterial",
                                        dynlib: dynlibraylib.}
proc DrawModel*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.stdcall,
    importc: "DrawModel", dynlib: dynlibraylib.}
proc DrawModelEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                 rotationAngle: cfloat; scale: Vector3; tint: Color) {.stdcall,
    importc: "DrawModelEx", dynlib: dynlibraylib.}
proc DrawModelWires*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.
    stdcall, importc: "DrawModelWires", dynlib: dynlibraylib.}
proc DrawModelWiresEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                      rotationAngle: cfloat; scale: Vector3; tint: Color) {.stdcall,
    importc: "DrawModelWiresEx", dynlib: dynlibraylib.}
proc DrawBoundingBox*(box: BoundingBox; color: Color) {.stdcall,
    importc: "DrawBoundingBox", dynlib: dynlibraylib.}
proc DrawBillboard*(camera: Camera; texture: Texture2D; center: Vector3; size: cfloat;
                   tint: Color) {.stdcall, importc: "DrawBillboard",
                                dynlib: dynlibraylib.}
proc DrawBillboardRec*(camera: Camera; texture: Texture2D; sourceRec: Rectangle;
                      center: Vector3; size: cfloat; tint: Color) {.stdcall,
    importc: "DrawBillboardRec", dynlib: dynlibraylib.}
proc CheckCollisionSpheres*(centerA: Vector3; radiusA: cfloat; centerB: Vector3;
                           radiusB: cfloat): bool {.stdcall,
    importc: "CheckCollisionSpheres", dynlib: dynlibraylib.}
proc CheckCollisionBoxes*(box1: BoundingBox; box2: BoundingBox): bool {.stdcall,
    importc: "CheckCollisionBoxes", dynlib: dynlibraylib.}
proc CheckCollisionBoxSphere*(box: BoundingBox; centerSphere: Vector3;
                             radiusSphere: cfloat): bool {.stdcall,
    importc: "CheckCollisionBoxSphere", dynlib: dynlibraylib.}
proc CheckCollisionRaySphere*(ray: Ray; spherePosition: Vector3; sphereRadius: cfloat): bool {.
    stdcall, importc: "CheckCollisionRaySphere", dynlib: dynlibraylib.}
proc CheckCollisionRaySphereEx*(ray: Ray; spherePosition: Vector3;
                               sphereRadius: cfloat; collisionPoint: ptr Vector3): bool {.
    stdcall, importc: "CheckCollisionRaySphereEx", dynlib: dynlibraylib.}
proc CheckCollisionRayBox*(ray: Ray; box: BoundingBox): bool {.stdcall,
    importc: "CheckCollisionRayBox", dynlib: dynlibraylib.}
proc GetCollisionRayModel*(ray: Ray; model: ptr Model): RayHitInfo {.stdcall,
    importc: "GetCollisionRayModel", dynlib: dynlibraylib.}
proc GetCollisionRayTriangle*(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3): RayHitInfo {.
    stdcall, importc: "GetCollisionRayTriangle", dynlib: dynlibraylib.}
proc GetCollisionRayGround*(ray: Ray; groundHeight: cfloat): RayHitInfo {.stdcall,
    importc: "GetCollisionRayGround", dynlib: dynlibraylib.}
proc LoadText*(fileName: cstring): cstring {.stdcall, importc: "LoadText",
    dynlib: dynlibraylib.}
proc LoadShader*(vsFileName: cstring; fsFileName: cstring): Shader {.stdcall,
    importc: "LoadShader", dynlib: dynlibraylib.}
proc LoadShaderCode*(vsCode: cstring; fsCode: cstring): Shader {.stdcall,
    importc: "LoadShaderCode", dynlib: dynlibraylib.}
proc UnloadShader*(shader: Shader) {.stdcall, importc: "UnloadShader",
                                  dynlib: dynlibraylib.}
proc GetShaderDefault*(): Shader {.stdcall, importc: "GetShaderDefault",
                                dynlib: dynlibraylib.}
proc GetTextureDefault*(): Texture2D {.stdcall, importc: "GetTextureDefault",
                                    dynlib: dynlibraylib.}
proc GetShaderLocation*(shader: Shader; uniformName: cstring): cint {.stdcall,
    importc: "GetShaderLocation", dynlib: dynlibraylib.}
proc SetShaderValue*(shader: Shader; uniformLoc: cint; value: ptr cfloat; size: cint) {.
    stdcall, importc: "SetShaderValue", dynlib: dynlibraylib.}
proc SetShaderValuei*(shader: Shader; uniformLoc: cint; value: ptr cint; size: cint) {.
    stdcall, importc: "SetShaderValuei", dynlib: dynlibraylib.}
proc SetShaderValueMatrix*(shader: Shader; uniformLoc: cint; mat: Matrix) {.stdcall,
    importc: "SetShaderValueMatrix", dynlib: dynlibraylib.}
proc SetMatrixProjection*(proj: Matrix) {.stdcall, importc: "SetMatrixProjection",
                                       dynlib: dynlibraylib.}
proc SetMatrixModelview*(view: Matrix) {.stdcall, importc: "SetMatrixModelview",
                                      dynlib: dynlibraylib.}
proc GetMatrixModelview*(): Matrix {.stdcall, importc: "GetMatrixModelview",
                                  dynlib: dynlibraylib.}
proc GenTextureCubemap*(shader: Shader; skyHDR: Texture2D; size: cint): Texture2D {.
    stdcall, importc: "GenTextureCubemap", dynlib: dynlibraylib.}
proc GenTextureIrradiance*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.
    stdcall, importc: "GenTextureIrradiance", dynlib: dynlibraylib.}
proc GenTexturePrefilter*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.
    stdcall, importc: "GenTexturePrefilter", dynlib: dynlibraylib.}
proc GenTextureBRDF*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.
    stdcall, importc: "GenTextureBRDF", dynlib: dynlibraylib.}
proc BeginShaderMode*(shader: Shader) {.stdcall, importc: "BeginShaderMode",
                                     dynlib: dynlibraylib.}
proc EndShaderMode*() {.stdcall, importc: "EndShaderMode", dynlib: dynlibraylib.}
proc BeginBlendMode*(mode: cint) {.stdcall, importc: "BeginBlendMode",
                                dynlib: dynlibraylib.}
proc EndBlendMode*() {.stdcall, importc: "EndBlendMode", dynlib: dynlibraylib.}
proc GetVrDeviceInfo*(vrDeviceType: cint): VrDeviceInfo {.stdcall,
    importc: "GetVrDeviceInfo", dynlib: dynlibraylib.}
proc InitVrSimulator*(info: VrDeviceInfo) {.stdcall, importc: "InitVrSimulator",
    dynlib: dynlibraylib.}
proc CloseVrSimulator*() {.stdcall, importc: "CloseVrSimulator", dynlib: dynlibraylib.}
proc IsVrSimulatorReady*(): bool {.stdcall, importc: "IsVrSimulatorReady",
                                dynlib: dynlibraylib.}
proc SetVrDistortionShader*(shader: Shader) {.stdcall,
    importc: "SetVrDistortionShader", dynlib: dynlibraylib.}
proc UpdateVrTracking*(camera: ptr Camera) {.stdcall, importc: "UpdateVrTracking",
    dynlib: dynlibraylib.}
proc ToggleVrMode*() {.stdcall, importc: "ToggleVrMode", dynlib: dynlibraylib.}
proc BeginVrDrawing*() {.stdcall, importc: "BeginVrDrawing", dynlib: dynlibraylib.}
proc EndVrDrawing*() {.stdcall, importc: "EndVrDrawing", dynlib: dynlibraylib.}
proc InitAudioDevice*() {.stdcall, importc: "InitAudioDevice", dynlib: dynlibraylib.}
proc CloseAudioDevice*() {.stdcall, importc: "CloseAudioDevice", dynlib: dynlibraylib.}
proc IsAudioDeviceReady*(): bool {.stdcall, importc: "IsAudioDeviceReady",
                                dynlib: dynlibraylib.}
proc SetMasterVolume*(volume: cfloat) {.stdcall, importc: "SetMasterVolume",
                                     dynlib: dynlibraylib.}
proc LoadWave*(fileName: cstring): Wave {.stdcall, importc: "LoadWave",
                                      dynlib: dynlibraylib.}
proc LoadWaveEx*(data: pointer; sampleCount: cint; sampleRate: cint; sampleSize: cint;
                channels: cint): Wave {.stdcall, importc: "LoadWaveEx",
                                     dynlib: dynlibraylib.}
proc LoadSound*(fileName: cstring): Sound {.stdcall, importc: "LoadSound",
                                        dynlib: dynlibraylib.}
proc LoadSoundFromWave*(wave: Wave): Sound {.stdcall, importc: "LoadSoundFromWave",
    dynlib: dynlibraylib.}
proc UpdateSound*(sound: Sound; data: pointer; samplesCount: cint) {.stdcall,
    importc: "UpdateSound", dynlib: dynlibraylib.}
proc UnloadWave*(wave: Wave) {.stdcall, importc: "UnloadWave", dynlib: dynlibraylib.}
proc UnloadSound*(sound: Sound) {.stdcall, importc: "UnloadSound",
                               dynlib: dynlibraylib.}
proc PlaySound*(sound: Sound) {.stdcall, importc: "PlaySound", dynlib: dynlibraylib.}
proc PauseSound*(sound: Sound) {.stdcall, importc: "PauseSound", dynlib: dynlibraylib.}
proc ResumeSound*(sound: Sound) {.stdcall, importc: "ResumeSound",
                               dynlib: dynlibraylib.}
proc StopSound*(sound: Sound) {.stdcall, importc: "StopSound", dynlib: dynlibraylib.}
proc IsSoundPlaying*(sound: Sound): bool {.stdcall, importc: "IsSoundPlaying",
                                       dynlib: dynlibraylib.}
proc SetSoundVolume*(sound: Sound; volume: cfloat) {.stdcall,
    importc: "SetSoundVolume", dynlib: dynlibraylib.}
proc SetSoundPitch*(sound: Sound; pitch: cfloat) {.stdcall, importc: "SetSoundPitch",
    dynlib: dynlibraylib.}
proc WaveFormat*(wave: ptr Wave; sampleRate: cint; sampleSize: cint; channels: cint) {.
    stdcall, importc: "WaveFormat", dynlib: dynlibraylib.}
proc WaveCopy*(wave: Wave): Wave {.stdcall, importc: "WaveCopy", dynlib: dynlibraylib.}
proc WaveCrop*(wave: ptr Wave; initSample: cint; finalSample: cint) {.stdcall,
    importc: "WaveCrop", dynlib: dynlibraylib.}
proc GetWaveData*(wave: Wave): ptr cfloat {.stdcall, importc: "GetWaveData",
                                       dynlib: dynlibraylib.}
proc LoadMusicStream*(fileName: cstring): Music {.stdcall,
    importc: "LoadMusicStream", dynlib: dynlibraylib.}
proc UnloadMusicStream*(music: Music) {.stdcall, importc: "UnloadMusicStream",
                                     dynlib: dynlibraylib.}
proc PlayMusicStream*(music: Music) {.stdcall, importc: "PlayMusicStream",
                                   dynlib: dynlibraylib.}
proc UpdateMusicStream*(music: Music) {.stdcall, importc: "UpdateMusicStream",
                                     dynlib: dynlibraylib.}
proc StopMusicStream*(music: Music) {.stdcall, importc: "StopMusicStream",
                                   dynlib: dynlibraylib.}
proc PauseMusicStream*(music: Music) {.stdcall, importc: "PauseMusicStream",
                                    dynlib: dynlibraylib.}
proc ResumeMusicStream*(music: Music) {.stdcall, importc: "ResumeMusicStream",
                                     dynlib: dynlibraylib.}
proc IsMusicPlaying*(music: Music): bool {.stdcall, importc: "IsMusicPlaying",
                                       dynlib: dynlibraylib.}
proc SetMusicVolume*(music: Music; volume: cfloat) {.stdcall,
    importc: "SetMusicVolume", dynlib: dynlibraylib.}
proc SetMusicPitch*(music: Music; pitch: cfloat) {.stdcall, importc: "SetMusicPitch",
    dynlib: dynlibraylib.}
proc SetMusicLoopCount*(music: Music; count: cint) {.stdcall,
    importc: "SetMusicLoopCount", dynlib: dynlibraylib.}
proc GetMusicTimeLength*(music: Music): cfloat {.stdcall,
    importc: "GetMusicTimeLength", dynlib: dynlibraylib.}
proc GetMusicTimePlayed*(music: Music): cfloat {.stdcall,
    importc: "GetMusicTimePlayed", dynlib: dynlibraylib.}
proc InitAudioStream*(sampleRate: cuint; sampleSize: cuint; channels: cuint): AudioStream {.
    stdcall, importc: "InitAudioStream", dynlib: dynlibraylib.}
proc UpdateAudioStream*(stream: AudioStream; data: pointer; samplesCount: cint) {.
    stdcall, importc: "UpdateAudioStream", dynlib: dynlibraylib.}
proc CloseAudioStream*(stream: AudioStream) {.stdcall, importc: "CloseAudioStream",
    dynlib: dynlibraylib.}
proc IsAudioBufferProcessed*(stream: AudioStream): bool {.stdcall,
    importc: "IsAudioBufferProcessed", dynlib: dynlibraylib.}
proc PlayAudioStream*(stream: AudioStream) {.stdcall, importc: "PlayAudioStream",
    dynlib: dynlibraylib.}
proc PauseAudioStream*(stream: AudioStream) {.stdcall, importc: "PauseAudioStream",
    dynlib: dynlibraylib.}
proc ResumeAudioStream*(stream: AudioStream) {.stdcall,
    importc: "ResumeAudioStream", dynlib: dynlibraylib.}
proc IsAudioStreamPlaying*(stream: AudioStream): bool {.stdcall,
    importc: "IsAudioStreamPlaying", dynlib: dynlibraylib.}
proc StopAudioStream*(stream: AudioStream) {.stdcall, importc: "StopAudioStream",
    dynlib: dynlibraylib.}
proc SetAudioStreamVolume*(stream: AudioStream; volume: cfloat) {.stdcall,
    importc: "SetAudioStreamVolume", dynlib: dynlibraylib.}
proc SetAudioStreamPitch*(stream: AudioStream; pitch: cfloat) {.stdcall,
    importc: "SetAudioStreamPitch", dynlib: dynlibraylib.}

##  Some Basic Colors
## // NOTE: Custom raylib color palette for amazing visuals on WHITE background
## #define LIGHTGRAY  CLITERAL{ 200, 200, 200, 255 }   // Light Gray
## #define GRAY       CLITERAL{ 130, 130, 130, 255 }   // Gray
## #define DARKGRAY   CLITERAL{ 80, 80, 80, 255 }      // Dark Gray
## #define YELLOW     CLITERAL{ 253, 249, 0, 255 }     // Yellow
## #define GOLD       CLITERAL{ 255, 203, 0, 255 }     // Gold
## #define ORANGE     CLITERAL{ 255, 161, 0, 255 }     // Orange
## #define PINK       CLITERAL{ 255, 109, 194, 255 }   // Pink
## #define RED        CLITERAL{ 230, 41, 55, 255 }     // Red
## #define MAROON     CLITERAL{ 190, 33, 55, 255 }     // Maroon
## #define GREEN      CLITERAL{ 0, 228, 48, 255 }      // Green
## #define LIME       CLITERAL{ 0, 158, 47, 255 }      // Lime
## #define DARKGREEN  CLITERAL{ 0, 117, 44, 255 }      // Dark Green
## #define SKYBLUE    CLITERAL{ 102, 191, 255, 255 }   // Sky Blue
## #define BLUE       CLITERAL{ 0, 121, 241, 255 }     // Blue
## #define DARKBLUE   CLITERAL{ 0, 82, 172, 255 }      // Dark Blue
## #define PURPLE     CLITERAL{ 200, 122, 255, 255 }   // Purple
## #define VIOLET     CLITERAL{ 135, 60, 190, 255 }    // Violet
## #define DARKPURPLE CLITERAL{ 112, 31, 126, 255 }    // Dark Purple
## #define BEIGE      CLITERAL{ 211, 176, 131, 255 }   // Beige
## #define BROWN      CLITERAL{ 127, 106, 79, 255 }    // Brown
## #define DARKBROWN  CLITERAL{ 76, 63, 47, 255 }      // Dark Brown
## 
## #define WHITE      CLITERAL{ 255, 255, 255, 255 }   // White
## #define BLACK      CLITERAL{ 0, 0, 0, 255 }         // Black
## #define BLANK      CLITERAL{ 0, 0, 0, 0 }           // Blank (Transparent)
## #define MAGENTA    CLITERAL{ 255, 0, 255, 255 }     // Magenta
## #define RAYWHITE   CLITERAL{ 245, 245, 245, 255 }   // My own White (raylib logo)

let
  RAYWHITE* = Color(r: 245.cuchar, g: 245.cuchar, b: 245.cuchar, a: 255.cuchar)
  LIGHTGRAY* = Color(r: 200.cuchar, g: 200.cuchar, b: 200.cuchar, a: 255.cuchar)
  DARKGRAY* = Color(r: 80.cuchar, g: 80.cuchar, b: 80.cuchar, a: 255.cuchar)
  RED* = Color(r: 230.cuchar, g: 41.cuchar, b: 55.cuchar, a: 255.cuchar)
