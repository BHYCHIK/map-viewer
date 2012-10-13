unit terrain;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, terrain;

type
  TPolygonPoint = record
    X: Extended;
    Y: Extended;
    Z: Extended;
    RealHeight: Extended;
  end;

  TPolygon = record
    Point1: Extended;
    Point2: Extended;
    Point3: Extended;
  end;

  TPolygonPoints = array of array of TPolygonPoint;

  function OpenTerrain(const path: String): TPolygonPoints;

implementation

function OpenTerrain(const path: String): TPolygonPoints;
const
  Modifier = 5;
var
  map: TBitmap;
  X, Y: Integer;
begin
  map := TBitmap.Create;
  SetLength(result, map.Width, map.Height);
  for X := Low(Result) to High(Result) do
  begin
    for Y := Low(Result[x]) to High(Result[x]) do
    begin
      result[x, y].X := X * Modifier;
      result[x, y].Y := Y * Modifier;
      result[x, y].Z := getRValue(map.Canvas.Pixels[X, Y]) * Modifier;
    end;
  end;
  map.Free;
end;

function CentralProjectionOfPoint(point: TPolygonPoint;
    const camera: TPolygonPoint;
    Alpha, Beta: extended): TPolygonPoint;
const
  Zplane = 10;
begin
  Alpha := Alpha * PI / 180.0;
  Beta := Beta * PI / 180.0;

  point.X := point.X - camera.X;
  point.Y := point.Y - camera.Y;

  result.X := point.X * cos(Alpha) - point.Y * sin(Alpha);
  result.Y := point.X * sin(Alpha) * cos(Beta) + point.Y * cos(Alpha)* cos(Beta)
              - point.Z * sin(Beta);
  result.Z := point.X * sin(Alpha) * sin(Beta) + point.Y * cos(Alpha)* sin(Beta)
              + point.Z * cos(Beta);

  result.X := result.X * (camera.Z - Zplane)/(camera.Z - result.Z);
  result.Y := result.Y * (camera.Z - Zplane)/(camera.Z - result.Z);
  result.Z := result.Z - Zplane;
end;

end.
