# FOREWORD

A computer desktop is an unusual kind of artefact. It is something that many
people use every day, often for hours at a time, yet rarely consider as a thing
in its own right.

Some might think of desktops in terms of the software that they consist of,
like window managers, panels, menus, launchers and applications. Yet the
desktop is more than the sum of these parts. It is an environment that has been
designed, assembled and shaped to provide a particular experience.

Building a desktop is therefore both a design activity and an engineering
exercise. It involves questions of aesthetics, usability and personal taste,
alongside questions of architecture, integration and technical implementation.

This book explores both sides of that activity.

# PART 1 - THE CRAFT

This section discusses the craft of desktop building in a technology agnostic
way.

## 1.a - What is a desktop?

A desktop is the interactive environment through which a person engages with
and makes use of a computer. It brings together visual presentation,
interaction mechanisms, applications, tools and services to provide a coherent
and usable working environment.

A desktop is not necessarily a single application or software package. It is an
assembled system whose constituent parts collectively provide the environment
in which a person works.

The desktop is the experience that the user encounters, rather than simply the
software that implements it.

This distinction is important. A desktop may depend on applications and
services that it neither owns nor implements. Its coherence comes from how
these elements are brought together, how they interact and how they are
presented to the user.

## 1.b - Desktop-crafting as an artform

A desktop is something that is crafted. It is designed and assembled, its
behaviour is shaped, its shortcomings are observed and it is refined over time.
The end result is not just a collection of software packages, but an
environment and place.

Desktop design is also an art. There are questions of taste, proportion,
rhythm, consistency and character that cannot be resolved through functional
requirements alone.

There is no single correct desktop. There are, however, better and worse ways
of realising a particular design intention.

## 1.c - The difference between customisation and design

Customisation changes how individual components look or behave. Design
considers the experience created by those components collectively.

A desktop can be extensively customised without being particularly well
designed. Changing colours, installing a different panel or replacing a menu
does not necessarily produce a coherent result.

Design begins with intent. What should the desktop feel like? How much
information should it present? How should it direct or avoid directing
attention? Should it be calm, busy, playful, austere or utilitarian? How should
it respond to the user's actions?

A desktop has a visual identity. Its components should look as though they
belong together.

It is therefore useful to establish a visual language relatively early, rather
than treating appearance as something to address after functionality is
complete.

This might consider:

- Fonts
- Colour palette
- Spacing and alignment rules
- Iconography
- Window decoration
- Panel dimensions and positioning
- Surface shapes, borders and shadows
- Interaction states, including hover, focus, active and disabled
- Animation principles

These are not independent styling decisions. They form a set of relationships
that should be applied consistently.

For example, a panel, menu, notification and settings window should not
independently invent their own spacing, corner radii, typography and colours.

The objective is not uniformity for its own sake, but a recognisable and
coherent visual language.

## 1.d - Coherence and restraint

The desktop is the experience the user actually encounters. Its quality is
determined not by the merits of individual components, but by how well they
work together.

A desktop does not improve simply because another feature has been added. Every
component creates relationships, dependencies and potential inconsistencies.
Each addition also introduces something that must be maintained, understood and
integrated into the overall experience.

This does not mean that minimalism is an objective. Sometimes there is beauty
in simplicity, and sometimes a more elaborate solution is appropriate. What
matters is that the choices are deliberate and that the resulting desktop has a
recognisable character.

There is also an important distinction between the expression of taste and the
imposition of taste. A desktop can be an expression of personal preference,
while the software components that support it need not impose their authors'
preferences on everyone else.

Coherence is not achieved by making everything identical. It comes from
establishing appropriate relationships between the parts, and ensuring that
they collectively serve the intended experience.

# PART 2 - THE FOUNDATION

This section evaluates design options and begins to down-select technology.

## 2.a - Design intentions and requirements

## 2.b - Technology stack

## 2.c - Distribution

## 2.d - Compositor

The compositor is a central component of a Wayland desktop. It manages the
presentation of surfaces, window positioning, focus and user interaction.

Some compositors are developed as part of comprehensive desktop environments.
GNOME and KDE, for example, provide largely integrated desktop experiences with
their own conventions, applications and supporting infrastructure.

In this book, labwc is used as the foundation.

Labwc is a stacking Wayland compositor inspired by Openbox. It is deliberately
focused on window management and does not attempt to provide a complete desktop
environment. This makes it particularly useful for exploring desktop
construction.

## 2.e - Desktop capabilities and components

### Display management

<!-- Outputs, resolution, scaling -->

### Panel

### Backgrounds

### Decorations

### Application management

<!-- Launching, identification, tracking -->

### Menus

### Launchers

### Notifications

# PART 3 - THE DESKTOP TAKES SHAPE

In this section, several desktops are built to explore the craft in practice.
They are kept simple and avoid implementing all the capabilities and design
considerations identified in parts 1 and 2 of this book.

## 3.a - Substrate

A bare-bones Arch Linux installation with labwc will be used as the starting
point for constructing the desktops in this book.

The choice of distribution is largely incidental to the design principles being
explored. Arch Linux is used here because it provides a relatively
straightforward way to establish a minimal system and install only the
components needed.

The installation was created using `archinstall` from the Arch Linux
installation image, selecting the labwc profile.

At this point, very few additional packages have been explicitly installed. The
system provides a functioning graphical session, a compositor and the ability
to launch applications, but little in the way of a complete desktop experience.

<img src="img/3-a-001.png" />

The following package list illustrates the starting point.

```
alacritty base grub htop labwc lightdm-gtk-greeter mesa nano seatd sudo vim
wget xdg-utils
```

<img src="img/3-a-002.png" />

This is enough to get a compositor fired up and run programs, but it does not
provide much of a desktop. Running `free -h` shows that a mere 408 MiB of
harddisk space is used.

This starting point should be easy to achieve on many distributions by simply
installing `labwc` from their repositories and choosing it in the Display
Manager (graphical login program). However, at this stage there is not a lot
that meets the eye other than a blank canvas for construction.

<img src="img/3-a-003.png" />

## 3.b Base dependencies

A few more base package are needed to create a very simple desktop. The
instructions in "Desktop One" assume that the ones listed below have been
installed.

[bin/install-arch-linux-packages.sh](bin/install-arch-linux-packages.sh)

@code:bin/install-arch-linux-packages.sh:0

## 3.c - Desktop One

### Palette

A simple palette has been chosen for this first desktop. It is derived from
Adwaita-Dark and KvGnomeDark which will be discussed shortly; it is also
reflected in the labTeallach theme that will be used by the compositor.

<img src="assets/swatch-282828.png" alt="#282828" /> <img src="assets/swatch-2e2e2e.png" alt="#2e2e2e" /> <img src="assets/swatch-303030.png" alt="#303030" /> <img src="assets/swatch-353535.png" alt="#353535" /> <img src="assets/swatch-505050.png" alt="#505050" /> <img src="assets/swatch-909090.png" alt="#909090" /> <img src="assets/swatch-ffffff.png" alt="#ffffff" />

### First steps

To start with, setup a simple root-menu to help launch installed programs.

Create `~/.config/labwc/menu.xml`:

```XML
<openbox_menu>
<menu id="root-menu">
  <menu id="Applications" label="Applications" execute="labwc-menu-generator -p -n" />
  <separator />
  <item label="Reconfigure">
    <action name="Reconfigure" />
  </item>
  <item label="Exit">
    <action name="If">
      <prompt message="Do you really want to exit the compositor?" />
      <then>
        <action name="Exit" />
      </then>
    </action>
  </item>
</menu>
</openbox_menu>
```

Then run the command `labwc -r` to load the menu, which should look like this:

<img src="img/3-c-001.png" />

From the root-menu, launch `labwc-tweaks` and set the keyboard layout.

<img src="img/3-c-003.png" />

### Themes and fonts

Now that a working environment exists, the difference between toolkit looks
can be observed. The screenshot below shows how different Qt6, Gtk3 and Gkt4
look out of the box.

<img src="img/3-c-004.png" />

Similarly, comparing `pcmanfm-qt` and `thunar` shows default looks with no
toolkit or icon themes set.

<img src="img/3-c-005.png" />

Set the Qt theme by taking the following steps:

1. Set `QT_QPA_PLATFORMTHEME=qt6ct` in `~/.config/labwc/environment`.
2. Run `labwc -r` to make the environment variable available to applications.
3. Open `qt6ct` (called "Qt6 Settings" in the root-menu), and choose style
   `kvantum` under the "Appearance" tab.
4. Whilst in `qt6ct`, select `Papirus-Dark` under the "Icon Theme" tab.
5. Also set `DejaVu Sans 10` under the "Font" tab.
6. Open `kvantummanager` is choose theme `KvGnomeDark`.

<img src="img/3-c-010.png" />
<img src="img/3-c-011.png" />
<img src="img/3-c-012.png" />

Setting the Gtk theme and font is simpler. Merely issue these commands:

@code:desktop-one/bootstrap.sh:0

Running `mousepad` it is now noticeable that the Server Side Decoration (SSD),
for example the titlebar, is still using a different them. Correct this by
setting theme `labTeallach` in `labwc-tweaks`. Also, select icon theme
`Papirus-Dark` to show the correct menu theme in any compositor generated
graphics like the titlebar and window-switcher.

<img src="img/3-c-013.png" />
<img src="img/3-c-014.png" />

## 3.d - Desktop Two

@code:desktop-two/bootstrap.sh:0

# PART 4 - THE ENGINEERING

In this section, functionality and capability are explored at a deeper level.

