import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


ApplicationWindow {
	width: 1920
	height: 1080
	visibility: Window.Maximized

	Image {
		source: "images/background.png"
		anchors.fill: parent
	}


	GridLayout {
		columns: 3
		columnSpacing: 15
		rows: 2
		rowSpacing: 15
		anchors.margins: 15
		anchors.fill: parent


		/* ----- Left Turn Signal ----------------------------------------------------------------------------------------------------------- */
		Image {
			id: leftSignal
			Layout.column: 0
			Layout.row: 0
			Layout.fillWidth: true
			Layout.fillHeight: true
			source: "images/left_off.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent

				onClicked: {
					controlPanel.handleButtonPress(1);						// Directly call a function in Python to handle the signal logic
				}
			}
		}

		/* ----- Front Parking Lights ------------------------------------------------------------------------------------------------------- */
		Image {
			id: frontParkingLights
			Layout.column: 1
			Layout.row: 0
			Layout.fillWidth: true
			Layout.fillHeight: true
			source: "images/parking_off.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent

				onClicked: {
					controlPanel.handleButtonPress(2);
				}
			}
		}

		/* ----- Right Turn Signal ---------------------------------------------------------------------------------------------------------- */
		Image {
			id: rightSignal
			Layout.column: 2
			Layout.row: 0
			Layout.fillWidth: true
			Layout.fillHeight: true
			source: "images/right_off.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent

				onClicked: {
					controlPanel.handleButtonPress(3);
				}
			}
		}

		/* ----- Sequential Brake Lights ---------------------------------------------------------------------------------------------------- */
		Image {
			id: sequentialBrakeLights
			Layout.column: 0
			Layout.row: 1
			Layout.fillWidth: true
			Layout.fillHeight: true
			source: "images/brake_off.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent

				onClicked: {
					controlPanel.handleButtonPress(4);
				}
			}
		}

		/* ----- Rear Parking Lights ------------------------------------------------------------------------------------------------------------ */
		Image {
			id: rearParkingLights
			Layout.column: 1
			Layout.row: 1
			Layout.fillWidth: true
			Layout.fillHeight: true
			source: "images/parking_off.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent

				onClicked: {
					controlPanel.handleButtonPress(5);
				}
			}
		}

		/* ----- 3-3-1 Third Brake Light ---------------------------------------------------------------------------------------------------- */
		Image {
			id: thirdBrakeLight
			Layout.column: 2
			Layout.row: 1
			Layout.fillWidth: true
			Layout.fillHeight: true
			source: "images/brake_off.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent

				onClicked: {
					controlPanel.handleButtonPress(6);
				}
			}
		}
	}

	/* Signals linked to 'Control Panel' in `main.py` */
	Connections {
		target: controlPanel
		function onAnimationStateChanged(animationId, newState) {
			if (animationId === 1) {
				leftSignal.source = "images/left_" + (newState ? "on" : "off") + ".png";
			} else if (animationId === 2) {
				frontParkingLights.source = "images/parking_" + (newState ? "on" : "off") + ".png";
			} else if (animationId === 3) {
				rightSignal.source = "images/right_" + (newState ? "on" : "off") + ".png";
			} else if (animationId === 4) {
				sequentialBrakeLights.source = "images/brake_" + (newState ? "on" : "off") + ".png";
			} else if (animationId === 5) {
				rearParkingLights.source = "images/parking_" + (newState ? "on" : "off") + ".png";
			} else if (animationId === 6) {
				thirdBrakeLight.source = "images/brake_" + (newState ? "on" : "off") + ".png";
			}
			
		}
	}
}
