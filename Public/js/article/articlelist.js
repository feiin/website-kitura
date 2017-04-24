var letterColoredAvatar = function() {
    params = null;
    baseColors = [
        '808080',
        'CBA179',
        'e57373',
        'f06292',
        'ba68c8',
        '9575cd',
        '7986cb',
        '64b5f6',
        '4fc3f7',
        '4dd0e1',
        '4db6ac',
        '81c784',
        'aed581',
        'ff8a65',
        'd4e157',
        'ffd54f',
        'ffb74d',
        'a1887f',
        '90a4ae',
        '00408d',
        'f44336',
        'E91E63',
        '9C27B0',
        '673AB7',
        '3F51B5',
        '2196F3',
        '03A9F4',
        '00BCD4',
        '009688',
        '4CAF50',
        '8BC34A',
        'CDDC39',
        'FFC107',
        'FF9800',
        'FF5722',
    ];

    return {
        transformTextToColor: function (string){
            _this = this;
            num = 0;
            letters = string.split('');
            initialNbreOfLetter = letters.length;

            for (var i = 0; i < letters.length; i++) {
                num += letters[i].charCodeAt();
            };
            num  = (num+letters.length*2).toString();
            stringKey = num.substring(num.length, num.length - 2);

            if (parseInt(stringKey) > baseColors.length) {
                stringKey = stringKey.toString();
                stringKey = stringKey.charAt(0)+stringKey.charAt(2);
            }

            return baseColors[parseInt(stringKey)];
        },

        getColorFromString: function (string){
            _this = this;
            return '#' + _this.transformTextToColor(string);
        },

        display: function(string){
            _this = this;

            color = _this.getColorFromString(string);
            firstLetter = string.charAt(0);

            return {'color': color, 'firstLetter': firstLetter};
        },

        init: function (params){
            _this = this;
            _this.params = params;
        }
    };
}();

$(document).ready(function(){
    $('.authorAvatar').each(function(){
        coloredAvatar = letterColoredAvatar.display($(this).data('name'));
        $(this).css('background', coloredAvatar.color);
        $(this).text(coloredAvatar.firstLetter);
    });
});