class Inkscape < Formula
  desc "Professional vector graphics editor"
  homepage "https://inkscape.org/"
  url "https://inkscape.org/gallery/item/13330/inkscape-0.92.4_A6N0YOn.tar.bz2"

  depends_on "aspell"
  depends_on "automake" => :build
  depends_on "bdw-gc"
  depends_on "boehmgc"
  depends_on "boost"
  depends_on "boost-build" => :build
  depends_on "bzr"
  depends_on "cairomm"
  depends_on "cmake" => :build
  depends_on "dbus-glib"
  depends_on "desktop-file-utils"
  depends_on "gdk_pixbuf"
  depends_on "gettext"
  depends_on "glibmm"
  depends_on "gsl"
  depends_on "gtkspell3"
  depends_on "hicolor-icon-theme"
  depends_on "imagemagick"
  depends_on "intltool" => :build
  depends_on "lcms2"
  depends_on "libsoup" # > 0.92.x
  depends_on "libcdr"
  depends_on "libexif"
  depends_on "libtool" => :build
  depends_on "libvisio"
  depends_on "libxslt"
  depends_on "libwpg"
  depends_on "little-cms"
  depends_on "pango"
  depends_on "pkg-config" => :build
  depends_on "poppler"
  depends_on "popt"
  depends_on "potrace"

  depends_on "gtk+3"
  depends_on "gtkmm3"
  depends_on "gdl"

  #needs :cxx11

  if MacOS.version < :mavericks
    fails_with :clang do
      cause "inkscape's dependencies will be built with libstdc++ and fail to link."
    end
  end

  def install
    #ENV.cxx11
    ENV.append "LDFLAGS", "-liconv"

    system "mkdir", "build"
    Dir.chdir("build")
    system "cmake", "..", *std_cmake_args, "-DWITH_GTK3_EXPERIMENTAL=1"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/inkscape", "-x"
  end
end
