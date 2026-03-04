{
  flake.nixosModules.plugdev =
    { ... }:
    {
      services.udev.extraRules = builtins.readFile ./69-probe-rs.rules;
    };
}
