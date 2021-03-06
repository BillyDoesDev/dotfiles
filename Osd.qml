// https://github.com/Zren/plasma-lookandfeel-alphablack/blob/master/contents/osd/Osd.qml#L32-L40
// place this file at /usr/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/osd/Osd.qml

/*
 * Copyright 2014 Martin Klapetek <mklapetek@kde.org>
 * Copyright 2018 Chris Holland <zrenfire@gmail.com>
 * Copyright 2018 /u/koneko-nyaa from /r/kde
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Window 2.2
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtra

PlasmaCore.Dialog {
    id: root
    location: PlasmaCore.Types.Floating
    type: PlasmaCore.Dialog.OnScreenDisplay
    outputOnly: true

    // We need X11BypassWindowManagerHint otherwise KWin will
    // center the OSD the second time it appears.
    flags: Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint

    property int xPos: (Screen.desktopAvailableWidth - width) / 2
    property int yPos: Screen.desktopAvailableHeight*0.9 - height

    x: xPos
    y: yPos

    // OSD Timeout in msecs - how long it will stay on the screen
    property int timeout: 1800
    // This is either a text or a number, if showingProgress is set to true,
    // the number will be used as a value for the progress bar
    property var osdValue
    // Icon name to display
    property string icon
    // Set to true if the value is meant for progress bar,
    // false for displaying the value as normal text
    property bool showingProgress: false

    property bool animateOpacity: false

    Behavior on opacity {
        SequentialAnimation {
            // prevent press and hold from flickering
            PauseAnimation { duration: 100 }
            NumberAnimation {
                duration: root.timeout
                easing.type: Easing.InQuad
            }
        }
        enabled: root.animateOpacity
    }

    mainItem: OsdItem {
        rootItem: root
    }
}
