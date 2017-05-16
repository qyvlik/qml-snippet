import QtQuick 2.0
import QtQuick.Controls 2.0

import "./data.js" as IntlTelData

Item {
    width: 360
    height: 640
    ComboBox {
        width: parent.width
        model: countryAreaCode
        textRole: "iso2"
    }

    Component.onCompleted: {

        for(var iter in IntlTelData.allCountries) {
            var code = {
                "iso2": IntlTelData.allCountries[iter].iso2,
                "dialCode": IntlTelData.allCountries[iter].dialCode
            };

            countryAreaCode.append(code);
        }
    }
    ListModel {
        id: countryAreaCode
    }
}
