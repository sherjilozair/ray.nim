from raylib/raylib import nil

type
  Color* {.bycopy.} = object
    r*: uint8
    g*: uint8
    b*: uint8
    a*: uint8

  Rectangle* {.bycopy.} = object
    x*: int
    y*: int
    w*: int
    h*: int
  
  Texture2D* {.bycopy.} = object
    id*: int
    w*: int
    h*: int
    mipmaps*: int
    format*: PixelFormat
  
  Vector2* {.bycopy.} = object
    x*: float
    y*: float

  PixelFormat* {.pure.} = enum
    UNCOMPRESSED_GRAYSCALE = 1, UNCOMPRESSED_GRAY_ALPHA, UNCOMPRESSED_R5G6B5,
    UNCOMPRESSED_R8G8B8, UNCOMPRESSED_R5G5B5A1, UNCOMPRESSED_R4G4B4A4,
    UNCOMPRESSED_R8G8B8A8, UNCOMPRESSED_R32, UNCOMPRESSED_R32G32B32,
    UNCOMPRESSED_R32G32B32A32, COMPRESSED_DXT1_RGB, COMPRESSED_DXT1_RGBA,
    COMPRESSED_DXT3_RGBA, COMPRESSED_DXT5_RGBA, COMPRESSED_ETC1_RGB,
    COMPRESSED_ETC2_RGB, COMPRESSED_ETC2_EAC_RGBA, COMPRESSED_PVRT_RGB,
    COMPRESSED_PVRT_RGBA, COMPRESSED_ASTC_4x4_RGBA, COMPRESSED_ASTC_8x8_RGBA
  
  TextureFilterMode* {.pure.} = enum
    FILTER_POINT = 0, FILTER_BILINEAR, FILTER_TRILINEAR, FILTER_ANISOTROPIC_4X,
    FILTER_ANISOTROPIC_8X, FILTER_ANISOTROPIC_16X
  
  CameraType* {.size: sizeof(cint).} = enum
    CAMERA_PERSPECTIVE = 0, CAMERA_ORTHOGRAPHIC

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

  Something* = enum
    small = 0,
    big = 1

  RenderTexture2D* {.bycopy.} = object
    id*: int
    texture*: Texture2D
    depth*: Texture2D
  
  Key* {.pure.} = enum
    back = 4,
    volume_up = 24,
    volume_down = 25
    space = 32,
    zero = 48,
    one = 49,
    two = 50,
    three = 51,
    four = 52,
    five = 53,
    six = 54,
    seven = 55,
    eight = 56,
    nine = 57,
    a = 65,
    b = 66,
    c = 67,
    d = 68,
    e = 69,
    f = 70,
    g = 71,
    h = 72,
    i = 73,
    j = 74,
    k = 75,
    l = 76,
    m = 77,
    n = 78,
    o = 79,
    p = 80,
    q = 81,
    r = 82,
    s = 83,
    t = 84,
    u = 85,
    v = 86,
    w = 87,
    x = 88,
    y = 89,
    z = 90,
    escape = 256,
    enter = 257,
    tab = 258,
    backspace = 259,
    insert = 260,
    delete = 261,
    right = 262,
    left = 263,
    down = 264,
    up = 265,
    page_up = 266
    page_down = 267,
    home = 268,
    endkey = 269,
    caps_lock = 280,
    scroll_lock = 281,
    num_lock = 282,
    print_screen = 283,
    pause = 284,
    f1 = 290,
    f2 = 291,
    f3 = 292,
    f4 = 293,
    f5 = 294,
    f6 = 295,
    f7 = 296,
    f8 = 297,
    f9 = 298,
    f10 = 299,
    f11 = 300,
    f12 = 301,
    left_shift = 340,
    left_control = 341,
    left_alt = 342,
    right_shift = 344,
    right_control = 345,
    right_alt = 346,


let
  WHITE* = Color(r: 255, g: 255, b:255, a:255)
  RAYWHITE* = Color(r: 245, g: 245, b: 245, a: 255)
  LIGHTGRAY* = Color(r: 200, g: 200, b: 200, a: 255)
  DARKGRAY* = Color(r: 80, g: 80, b: 80, a: 255)
  RED* = Color(r: 230, g: 41, b: 55, a: 255)
  BLACK* = Color(r: 0, g: 0, b: 0, a: 255)

proc to_native(color: Color): raylib.Color =
  return raylib.Color(r: color.r.cuchar, g: color.g.cuchar, b: color.b.cuchar, a: color.a.cuchar)

proc to_native(t: Texture2D): raylib.Texture2D =
  return raylib.Texture2D(id: t.id.cuint, width: t.w.cint, height: t.h.cint, mipmaps: t.mipmaps.cint, format: ord(t.format).cint)

proc to_native(p: Vector2): raylib.Vector2 = 
  return raylib.Vector2(x: p.x.cfloat, y: p.y.cfloat)

proc to_native(rect: Rectangle): raylib.Rectangle = 
  return raylib.Rectangle(x: rect.x.cint, y: rect.y.cint, width: rect.w.cint, height: rect.h.cint)

proc to_native(t: RenderTexture2D): raylib.RenderTexture2D =
  return raylib.RenderTexture2D(id: t.id.cuint, texture: to_native(t.texture), depth: to_native(t.depth))

proc from_native(t: raylib.Texture2D): Texture2D =
  return Texture2D(id: t.id.int, w: t.width, h: t.height, mipmaps: t.mipmaps, format: PixelFormat(t.format.int))

proc from_native(t: raylib.RenderTexture2D): RenderTexture2D =
  let 
    texture = from_native(t.texture)
    depth = from_native(t.depth)
  return RenderTexture2D(id: t.id.int, texture: texture, depth: depth)


# texture: from_native(t.texture), depth: from_native(t.depth)


proc init_window*(width: int, height: int, title: string) = 
  raylib.InitWindow(width.cint, height.cint, title)

proc window_should_close*(): bool =
  return raylib.WindowShouldClose()

proc clear_background*(color : Color) =
  raylib.ClearBackground(to_native(color))

proc draw_dectangle*(x: int; y: int; w: int; h: int; color: Color) =
  raylib.DrawRectangle(x.cint, y.cint, w.cint, h.cint, to_native(color))

proc begin_drawing*() =
  raylib.BeginDrawing()

proc end_drawing*() =
  raylib.EndDrawing()

template draw*(code: untyped): untyped =
  raylib.BeginDrawing()
  code
  raylib.EndDrawing()

template draw_with*(canvas : RenderTexture2D, code: untyped): untyped =
  let native_canvas = to_native(canvas)
  raylib.BeginTextureMode(native_canvas)
  code
  raylib.EndTextureMode()
  raylib.BeginDrawing()
  raylib.ClearBackground(to_native(BLACK))
  raylib.DrawTexturePro(native_canvas.texture, 
    raylib.Rectangle(x:0, y:0, width:native_canvas.texture.width, height: -native_canvas.texture.height), 
    raylib.Rectangle(x:0, y:0, width:1440, height: 810), 
    raylib.Vector2(x:0, y:0), 0, to_native(WHITE))
  raylib.EndDrawing()

proc begin_texture_mode*(texture: RenderTexture2D) = 
  raylib.BeginTextureMode(to_native(texture))

proc end_texture_mode*() = 
  raylib.EndTextureMode()

proc close_window*() =
  raylib.CloseWindow()

proc load_render_texture*(width: int, height: cint): RenderTexture2D =
  let native = raylib.LoadRenderTexture(width.cint, height.cint)
  result = from_native(native)
  raylib.SetTextureFilter(native.texture, ord(TextureFilterMode.FILTER_POINT.int))


proc unload_render_texture*(texture: RenderTexture2D) =
  raylib.UnloadRenderTexture(to_native(texture))

proc set_texture_filter*(texture: Texture2D; filterMode: TextureFilterMode) =
  raylib.SetTextureFilter(to_native(texture), ord(filterMode).cint)

# Textures
proc load_texture*(file_name: string): Texture2D =
  return from_native(raylib.LoadTexture(file_name))

proc draw*(texture: Texture2d, x: int = 0, y: int = 0, tint: Color = WHITE) =
  raylib.DrawTexture(to_native(texture), x.cint, y.cint, to_native(tint))

proc draw*(texture: Texture2D, position: Vector2, tint: Color =  WHITE) =
  raylib.DrawTextureV(to_native(texture), to_native(position), to_native(tint))

proc draw*(texture: Texture2D, position: Vector2, rotation: float, scale: float; tint: Color = WHITE) =
  raylib.DrawTextureEx(to_native(texture), to_native(position), rotation.cfloat, scale.cfloat, to_native(tint))

proc draw*(texture: Texture2D; srcRect: Rectangle; dstRect: Rectangle; origin: Vector2 = Vector2(x: 0, y: 0); rotation: cfloat = 0.0; tint: Color = WHITE) = 
  raylib.DrawTexturePro(to_native(texture), to_native(srcRect), to_native(dstRect), to_native(origin), rotation.cfloat, to_native(tint))

#proc DrawTextureRec*(texture: Texture2D; sourceRec: Rectangle; position: Vector2; tint: Color) {.stdcall, importc: "DrawTextureRec", dynlib: dynlibraylib.}


