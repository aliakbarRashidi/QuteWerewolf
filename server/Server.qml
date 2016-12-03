import QtQuick 2.0
import Qt.WebSockets 1.0
import QtQuick.LocalStorage 2.0

import "config.js" as Config
import "game.js" as Game

Item {
	id: server

	property var konsole: console

	WebSocketServer {
		id: ws

		accept: true
		host: Config.host
		port: Config.port
		listen: true
		name: "werewolf"

		onClientConnected: {
			var player = playerComp.createObject(server, {ws: webSocket})
			player.start()
		}
	}

	Component {
		id: playerComp

		Player {

		}
	}

	Component.onCompleted: {
		Game.konsole = konsole
		Game.konsole.log("Server inited.")
	}
}
