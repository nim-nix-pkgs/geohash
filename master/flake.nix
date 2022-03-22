{
  description = ''Nim implementation of the geohash latitude/longitude geocode system'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-geohash-master.flake = false;
  inputs.src-geohash-master.owner = "twist-vector";
  inputs.src-geohash-master.ref   = "master";
  inputs.src-geohash-master.repo  = "nim-geohash.git";
  inputs.src-geohash-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-geohash-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-geohash-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}