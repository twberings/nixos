{config, lib, pkgs, sddm-theme, ...}:

{
	options = {
		sddm.enable = lib.mkEnableOption "Enable SDDM with theming";
	};

	config = lib.mkIf config.sddm.enable {
		services.displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			theme = "where_is_my_sddm_theme";
			package = pkgs.kdePackages.sddm;
		};
		environment.systemPackages = with pkgs; [
			(where-is-my-sddm-theme.override {
				variants = ["qt6"];
			})
			(catppuccin-where-is-my-sddm-theme.override {
				variants = ["qt6"];
				flavor = "mocha";
			})
		];

	};
}
