# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import math

"""
Utility methods for getting math word terms.
"""

BINARY_OPERATORS = {
    '^', '*', '/', '+', '-'
}

MATH_WORDS = {
    'ENG': {
        'unary_operators': {
            'squared': '^ 2',
            'cubed': '^ 3',
            'square root of': 'sqrt'
        },
        'binary_operators': {
            'plus': '+',
            'divided by': '/',
            'minus': '-',
            'times': '*',
            'to the power of': '^'
        },
        'numbers': {
            'zero': 0,
            'one': 1,
            'two': 2,
            'three': 3,
            'four': 4,
            'five': 5,
            'six': 6,
            'seven': 7,
            'eight': 8,
            'nine': 9,
            'ten': 10,
            'eleven': 11,
            'twelve': 12,
            'thirteen': 13,
            'fourteen': 14,
            'fifteen': 15,
            'sixteen': 16,
            'seventeen': 17,
            'eighteen': 18,
            'nineteen': 19,
            'twenty': 20,
            'thirty': 30,
            'forty': 40,
            'fifty': 50,
            'sixty': 60,
            'seventy': 70,
            'eighty': 80,
            'ninety': 90
        },
        'scales': {
            'hundred': 100,
            'thousand': 1000,
            'million': 1000000,
            'billion': 1000000000,
            'trillion': 1000000000000
        }
    },
    'FRE': {
        'binary_operators': {
            'plus': '+',
            'divisé par': '/',
            'moins': '-',
            'fois': '*',
            'équarri': '^ 2',
            'en cubes': '^ 3',
            'à la puissance': '^'
        },
        'numbers': {
            'un': 1,
            'deux': 2,
            'trois': 3,
            'quatre': 4,
            'cinq': 5,
            'six': 6,
            'sept': 7,
            'huit': 8,
            'neuf': 9,
            'dix': 10,
            'onze': 11,
            'douze': 12,
            'treize': 13,
            'quatorze': 14,
            'quinze': 15,
            'seize': 16,
            'dix-sept': 17,
            'dix-huit': 18,
            'dix-neuf': 19,
            'vingt': 20,
            'trente': 30,
            'quarante': 40,
            'cinquante': 50,
            'soixante': 60,
            'soixante-dix': 70,
            'septante': 70,
            'quatre-vingts': 80,
            'huitante': 80,
            'quatre-vingt-dix': 90,
            'nonante': 90
        },
        'scales': {
            'cent': 100,
            'mille': 1000,
            'un million': 1000000,
            'un milliard': 1000000000,
            'billions de': 1000000000000
        }
    },
    'GER': {
        'binary_operators': {
            'plus': '+',
            'geteilt durch': '/',
            'geteilt': '/',
            'minus': '-',
            'mal': '*',
            'multipliziert mit': '*',
            'im Quadrat': '^ 2',
            'hoch zwei': '^ 2',
            'quadriert': '^ 2',
            'cubed': '^ 3',
            'hoch': '^'
        },
        'numbers': {
            'eins': 1,
            'zwei': 2,
            'drei': 3,
            'vier': 4,
            'fünf': 5,
            'sechs': 6,
            'sieben': 7,
            'acht': 8,
            'neun': 9,
            'zehn': 10,
            'elf': 11,
            'zwölf': 12,
            'dreizehn': 13,
            'vierzehn': 14,
            'fünfzehn': 15,
            'sechszehn': 16,
            'siebzehn': 17,
            'achtzehn': 18,
            'neunzehn': 19,
            'zwanzig': 20,
            'dreißig': 30,
            'vierzig': 40,
            'fünfzig': 50,
            'sechzig': 60,
            'siebzig': 70,
            'achtzig': 80,
            'neunzig': 90
        },
        'scales': {
            'hundert': 100,
            'tausend': 1000,
            'hunderttausend': 100000,
            'million': 1000000,
            'milliarde': 1000000000,
            'billion': 1000000000000
        }
    },
    'ITA': {
        'binary_operators': {
            'più': '+',
            'diviso': '/',
            'meno': '-',
            'per': '*',
            'al quadrato': '^ 2',
            'cubetti': '^ 3',
            'alla potenza di': '^'
        },
        'numbers': {
            'uno': 1,
            'due': 2,
            'tre': 3,
            'quattro': 4,
            'cinque': 5,
            'sei': 6,
            'sette': 7,
            'otto': 8,
            'nove': 9,
            'dieci': 10,
            'undici': 11,
            'dodici': 12,
            'tredici': 13,
            'quattordici': 14,
            'quindici': 15,
            'sedici': 16,
            'diciassette': 17,
            'diciotto': 18,
            'diciannove': 19,
            'venti': 20,
            'trenta': 30,
            'quaranta': 40,
            'cinquanta': 50,
            'sessanta': 60,
            'settanta': 70,
            'ottanta': 80,
            'novanta': 90
        },
        'scales': {
            'centinaia': 100,
            'migliaia': 1000,
            'milioni': 1000000,
            'miliardi': 1000000000,
            'bilioni': 1000000000000
        }
    },
    'MAR': {
        'binary_operators': {
            'बेरीज': '+',
            'भागाकार': '/',
            'वजाबाकी': '-',
            'गुणाकार': '*',
            '(संख्या)वर्ग': '^ 2',
            'छोटे': '^ 3',
            'गुण्या करण्यासाठी': '^'
        },
        'numbers': {
            'शून्य': '0',
            'एक': '१',
            'दोन': '२',
            'तीन': '३',
            'चार': '४',
            'पाच': '५',
            'सहा': '६',
            'सात': '७',
            'आठ': '८',
            'नऊ': '९',
            'दहा': '१०',
            'अकरा': '११',
            'बारा': '१२',
            'तेरा': '१३',
            'चौदा': '१४',
            'पंधरा': '१५',
            'सोळा': '१६',
            'सतरा': '१७',
            'अठरा': '१८',
            'एकोणीस': '१९',
            'वीस': '२०',
            'तीस': '३०',
            'चाळीस': '४०',
            'पन्नास': '५०',
            'साठ': '६०',
            'सत्तर': '७०',
            'ऐंशी': '८०',
            'नव्वद': '९०',
            'शंभर': '१००'
        },
        'scales': {
            'शंभर': 100,
            'हजार': 1000,
            'दशलक्ष': 1000000,
            'अब्ज': 1000000000,
            'खर्व': 1000000000000
        }
    },
    'RUS': {
        'binary_operators': {
            'плюс': '+',
            'разделить': '/',
            'деленное на': '/',
            'делить на': '/',
            'минус': '-',
            'вычесть': '-',
            'отнять': '-',
            'умножить': '*',
            'умноженное на': '*',
            'умножить на': '*',
            'квадрат': '^ 2',
            'в квадрате': '^ 2',
            'возведенный в куб': '^ 3',
            'степень': '^'
        },
        'numbers': {
            'один': 1,
            'два': 2,
            'три': 3,
            'четыре': 4,
            'пять': 5,
            'шесть': 6,
            'семь': 7,
            'восемь': 8,
            'девять': 9,
            'десять': 10,
            'одинадцать': 11,
            'двенадцать': 12,
            'тринадцать': 13,
            'четырнадцать': 14,
            'пятнадцать': 15,
            'шестнадцать': 16,
            'семнадцать': 17,
            'восемнадцать': 18,
            'девятнадцать': 19,
            'двадцать': 20,
            'тридцать': 30,
            'сорок': 40,
            'пятьдесят': 50,
            'шестьдесят': 60,
            'семьдесят': 70,
            'восемьдесят': 80,
            'девяносто': 90
        },
        'scales': {
            'сто': 100,
            'тысяч': 1000,
            'миллион': 1000000,
            'миллиард': 1000000000,
            'триллион': 1000000000000
        }
    },
    'POR': {
        'unary_operators': {
            'ao quadrado': '^ 2',
            'ao cubo': '^ 3',
            'raiz quadrada de': 'sqrt'
        },
        'binary_operators': {
            'mais': '+',
            'dividido por': '/',
            'menos': '-',
            'vezes': '*',
            'elevado à potência de': '^'
        },
        'numbers': {
            'zero': 0,
            'um': 1,
            'dois': 2,
            'três': 3,
            'quatro': 4,
            'cinco': 5,
            'seis': 6,
            'sete': 7,
            'oito': 8,
            'nove': 9,
            'dez': 10,
            'onze': 11,
            'doze': 12,
            'treze': 13,
            'quatorze': 14,
            'catorze': 14,
            'quinze': 15,
            'dezesseis': 16,
            'dezessete': 17,
            'dezoito': 18,
            'dezenove': 19,
            'vinte': 20,
            'trinta': 30,
            'quarenta': 40,
            'cinquenta': 50,
            'sessenta': 60,
            'setenta': 70,
            'oitenta': 80,
            'noventa': 90
        },
        'scales': {
            'cem': 100,
            'mil': 1000,
            'milhão': 1000000,
            'bilhão': 1000000000,
            'trilhão': 1000000000000
        }
    }
}


LANGUAGE_CODES = list(MATH_WORDS.keys())


CONSTANTS = {
    'pi': 3.141693,
    'e': 2.718281
}


UNARY_FUNCTIONS = {
    'sqrt': math.sqrt,

    # Most people assume a log of base 10 when a base is not specified
    'log': math.log10
}


class InvalidLanguageCodeException(Exception):
    """
    Exception to be raised when a language code is given that
    is not a part of the ISO 639-2 standard.
    """
    pass


def word_groups_for_language(language_code):
    """
    Return the math word groups for a language code.
    The language_code should be an ISO 639-2 language code.
    https://www.loc.gov/standards/iso639-2/php/code_list.php
    """

    if language_code not in LANGUAGE_CODES:
        message = '{} is not an available language code'.format(language_code)
        raise InvalidLanguageCodeException(message)

    return MATH_WORDS[language_code]

def words_for_language(language_code):
    """
    Return the math words for a language code.
    The language_code should be an ISO 639-2 language code.
    https://www.loc.gov/standards/iso639-2/php/code_list.php
    """
    word_groups = word_groups_for_language(language_code)
    words = []

    for group in word_groups:
        words.extend(word_groups[group].keys())

    return words
