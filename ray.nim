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
    back = 4, volume_up = 24, volume_down, space = 32,
    zero = 48, one, two, three, four, five, six, seven, eight, nine,
    a = 65, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    escape = 256, enter, tab, backspace,
    insert = 260, delete, right, left, down, up, page_up, page_down, home, endkey,
    caps_lock = 280, scroll_lock, num_lock, print_screen, pause,
    f1 = 290, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12,
    left_shift = 340, left_control, left_alt, right_shift, right_control, right_alt
  
  Flag* {.pure.} = enum
    show_logo = 1
    fullscreen_mode = 2
    window_resizable = 4
    window_decorated = 8
    window_trasparent = 16
    msaa_4x_hint = 32
    vsync_hint = 64
    

let
  WHITE* = Color(r: 255, g: 255, b:255, a:255)
  RAYWHITE* = Color(r: 245, g: 245, b: 245, a: 255)
  LIGHTGRAY* = Color(r: 200, g: 200, b: 200, a: 255)
  DARKGRAY* = Color(r: 80, g: 80, b: 80, a: 255)
  RED* = Color(r: 230, g: 41, b: 55, a: 255)
  BLACK* = Color(r: 0, g: 0, b: 0, a: 255)
  BLANK* = Color(r: 0, g: 0, b: 0, a: 0)

proc to_c(color: Color): raylib.Color =
  return raylib.Color(r: color.r.cuchar, g: color.g.cuchar, b: color.b.cuchar, a: color.a.cuchar)

proc to_c(t: Texture2D): raylib.Texture2D =
  return raylib.Texture2D(id: t.id.cuint, width: t.w.cint, height: t.h.cint, mipmaps: t.mipmaps.cint, format: ord(t.format).cint)

proc to_c(p: Vector2): raylib.Vector2 = 
  return raylib.Vector2(x: p.x.cfloat, y: p.y.cfloat)

proc to_c(rect: Rectangle): raylib.Rectangle = 
  return raylib.Rectangle(x: rect.x.cint, y: rect.y.cint, width: rect.w.cint, height: rect.h.cint)

proc to_c(t: RenderTexture2D): raylib.RenderTexture2D =
  return raylib.RenderTexture2D(id: t.id.cuint, texture: to_c(t.texture), depth: to_c(t.depth))

proc to_nim(t: raylib.Texture2D): Texture2D =
  return Texture2D(id: t.id.int, w: t.width, h: t.height, mipmaps: t.mipmaps, format: PixelFormat(t.format.int))

proc to_nim(t: raylib.RenderTexture2D): RenderTexture2D =
  let 
    texture = to_nim(t.texture)
    depth = to_nim(t.depth)
  return RenderTexture2D(id: t.id.int, texture: texture, depth: depth)

proc to_nim(v: raylib.Vector2): Vector2 = 
  return Vector2(x: v.x.float, y: v.y.float)

proc to_nim(color: raylib.Color): Color =
  return Color(r: color.r.uint8, g: color.g.uint8, b: color.b.uint8, a: color.a.uint8)

# texture: to_nim(t.texture), depth: to_nim(t.depth)


proc init_window*(width: int, height: int, title: string) = 
  raylib.InitWindow(width.cint, height.cint, title)

proc window_should_close*(): bool =
  return raylib.WindowShouldClose()

proc clear_background*(color : Color) =
  raylib.ClearBackground(to_c(color))

proc draw_dectangle*(x: int; y: int; w: int; h: int; color: Color) =
  raylib.DrawRectangle(x.cint, y.cint, w.cint, h.cint, to_c(color))

proc begin_drawing*() =
  raylib.BeginDrawing()

proc end_drawing*() =
  raylib.EndDrawing()

template draw*(code: untyped): untyped =
  raylib.BeginDrawing()
  code
  raylib.EndDrawing()

template with*(canvas : RenderTexture2D, code: untyped): untyped =
  let native_canvas = to_c(canvas)
  raylib.BeginTextureMode(native_canvas)
  code
  raylib.EndTextureMode()
  
proc begin_texture_mode*(texture: RenderTexture2D) = 
  raylib.BeginTextureMode(to_c(texture))

proc end_texture_mode*() = 
  raylib.EndTextureMode()

proc close_window*() =
  raylib.CloseWindow()

proc load_render_texture*(width: int, height: cint): RenderTexture2D =
  let native = raylib.LoadRenderTexture(width.cint, height.cint)
  result = to_nim(native)
  raylib.SetTextureFilter(native.texture, ord(TextureFilterMode.FILTER_POINT.int))


proc unload_render_texture*(texture: RenderTexture2D) =
  raylib.UnloadRenderTexture(to_c(texture))

proc set_texture_filter*(texture: Texture2D; filterMode: TextureFilterMode) =
  raylib.SetTextureFilter(to_c(texture), ord(filterMode).cint)

# Textures
proc load_texture*(file_name: string): Texture2D =
  return to_nim(raylib.LoadTexture(file_name))

proc draw*(texture: Texture2d, x: int = 0, y: int = 0, tint: Color = WHITE) =
  raylib.DrawTexture(to_c(texture), x.cint, y.cint, to_c(tint))

proc draw*(texture: Texture2D, position: Vector2, tint: Color =  WHITE) =
  raylib.DrawTextureV(to_c(texture), to_c(position), to_c(tint))

proc draw*(texture: Texture2D, position: Vector2, rotation: float, scale: float; tint: Color = WHITE) =
  raylib.DrawTextureEx(to_c(texture), to_c(position), rotation.cfloat, scale.cfloat, to_c(tint))

proc draw*(texture: Texture2D; srcRect: Rectangle; dstRect: Rectangle; origin: Vector2 = Vector2(x: 0, y: 0); rotation: float = 0.0; tint: Color = WHITE) = 
  raylib.DrawTexturePro(to_c(texture), to_c(srcRect), to_c(dstRect), to_c(origin), rotation.cfloat, to_c(tint))

#proc DrawTextureRec*(texture: Texture2D; sourceRec: Rectangle; position: Vector2; tint: Color) {.stdcall, importc: "DrawTextureRec", dynlib: dynlibraylib.}


# keyboard
proc is_key_pressed*(key: Key): bool = return raylib.IsKeyPressed(ord(key).cint)

proc is_key_down*(key: Key): bool = return raylib.IsKeyDown(ord(key).cint)

proc is_key_released*(key: Key): bool = return raylib.IsKeyReleased(ord(key).cint)

proc is_key_up*(key: Key): bool = return raylib.IsKeyUp(ord(key).cint)

proc get_key_pressed*(): Key = return Key(raylib.GetKeyPressed())

# mouse

proc get_mouse_position*(): Vector2 = 
  return to_nim(raylib.GetMousePosition())

proc set_mouse_scale*(scale: float) =
  raylib.SetMouseScale(scale.cfloat)

# misc
proc draw_fps*(x: int, y: int) =
  raylib.DrawFPS(x.cint, y.cint)

proc set_config_flags*(flags: int) =
  raylib.SetConfigFlags(flags.cuchar)


proc set_target_fps*(fps: int) =
  raylib.SetTargetFPS(fps.cint)

# 2d shapes
# circles
proc draw_circle_gradient*(position: Vector2, radius: float, incolor: Color, outcolor: Color) =
  raylib.DrawCircleGradient(position.x.cint, position.y.cint, radius.float, to_c(incolor), to_c(outcolor))

proc draw_rectangle*(rec: Rectangle, color: Color) =
  raylib.DrawRectangleRec(rec.to_c, color.to_c)

# color
proc fade*(color: Color, alpha: float): Color =
  return raylib.Fade(color.to_c, alpha.cfloat).to_nim