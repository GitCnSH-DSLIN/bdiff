{
 * UBPatchUtils.pas
 *
 * Contains utility functions used for BPatch. Includes Pascal implementations
 * of some standard C library code.
 *
 * Copyright (c) 2003-2011 Peter D Johnson (www.delphidabbler.com).
 *
 * $Rev$
 * $Date$
 *
 * THIS SOFTWARE IS PROVIDED "AS-IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTY.
 * IN NO EVENT WILL THE AUTHORS BE HELD LIABLE FOR ANY DAMAGES ARISING FROM THE
 * USE OF THIS SOFTWARE.
 *
 * For conditions of distribution and use see the LICENSE file of visit
 * http://www.delphidabbler.com/software/bdiff/license
}


unit UBPatchUtils;


interface


uses
  // Project
  UBPatchTypes, UUtils;

const
  // Value representing end of file (as returned from TIO.GetCh).
  EOF: Integer = -1;
  // seek flag used by TIO.Seek (other possible values not used in program).
  SEEK_SET = 0;

type
  TIO = class(TCommonIO)
  public
    { Redirects standard input from a given file handle }
    class procedure RedirectStdIn(const Handle: Integer);
    { Seeks to given offset from given origin in file specified by Handle.
      Returns True on success, false on failure. }
    class function Seek(Handle: Integer; Offset: Longint; Origin: Integer):
      Boolean;
    { Checks if given file handle is at end of file. }
    class function AtEOF(Handle: Integer): Boolean;
    { Gets a single ANSI character from file specified by Handle and returns it,
      or EOF. }
    class function GetCh(Handle: Integer): Integer;
  end;

implementation

uses
  // Delphi
  SysUtils, Windows;


{ emulates C std lib fread function using Windows file handle }
function fread(ptr: Pointer; size: size_t; nobj: size_t;
  stream: Integer): size_t;
begin
  Result := size_t(SysUtils.FileRead(stream, ptr^, size * nobj)) div size;
end;

{ emulates C std lib fwrite function using Windows file handle }
function fwrite(ptr: Pointer; size: size_t; nobj: size_t;
  stream: Integer): size_t;
begin
  Result := size_t(SysUtils.FileWrite(stream, ptr^, size * nobj)) div size;
end;

{ TIO }

class function TIO.AtEOF(Handle: Integer): Boolean;
var
  CurPos: Integer;
  Size: Integer;
begin
  CurPos := SysUtils.FileSeek(Handle, 0, 1);
  Size := Windows.GetFileSize(Handle, nil);
  Result := CurPos = Size;
end;

class function TIO.GetCh(Handle: Integer): Integer;
var
  Ch: AnsiChar;
begin
  if AtEOF(Handle) then
    Result := EOF
  else
  begin
    SysUtils.FileRead(Handle, Ch, SizeOf(Ch));
    Result := Integer(Ch);
  end;
end;

class procedure TIO.RedirectStdIn(const Handle: Integer);
begin
  Windows.SetStdHandle(STD_INPUT_HANDLE, Cardinal(Handle));
end;

class function TIO.Seek(Handle, Offset, Origin: Integer): Boolean;
begin
  Result := SysUtils.FileSeek(Handle, Offset, Origin) >= 0;
end;

end.

