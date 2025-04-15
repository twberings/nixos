{config, lib, pkgs, sddm-theme, ...}:

{
	options = {
		services.sddm.enable = lib.mkEnableOption "Enable SDDM with theming";
	};

	config = lib.mkIf config.services.sddm.enable {
		# services.xserver.enable = true;
		services.displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			# wayland.compositor = "kwin";
			theme = "where_is_my_sddm_theme";
			package = pkgs.kdePackages.sddm;
		};
		environment.systemPackages = with pkgs; [
			(where-is-my-sddm-theme.override {
				variants = ["qt6"];
			})
		];

	};
}
