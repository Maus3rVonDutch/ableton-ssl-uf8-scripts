# decompyle3 version 3.9.0
# Python bytecode version base 3.7.0 (3394)
# Decompiled from: Python 3.8.9 (tags/v3.8.9:a743f81, Apr  6 2021, 14:02:34) [MSC v.1928 64 bit (AMD64)]
# Embedded file name: ..\..\..\output\Live\win_64_static\Release\python-bundle\MIDI Remote Scripts\MackieControl\MackieControlComponent.py
# Compiled at: 2023-03-03 17:20:11
# Size of source mod 2**32: 2576 bytes
from __future__ import absolute_import, print_function, unicode_literals
from builtins import object
import Live
from .consts import *

class MackieControlComponent(object):

    def __init__(self, main_script):
        self._MackieControlComponent__main_script = main_script

    def destroy(self):
        self._MackieControlComponent__main_script = None

    def main_script(self):
        return self._MackieControlComponent__main_script

    def shift_is_pressed(self):
        return self._MackieControlComponent__main_script.shift_is_pressed()

    def option_is_pressed(self):
        return self._MackieControlComponent__main_script.option_is_pressed()

    def control_is_pressed(self):
        return self._MackieControlComponent__main_script.control_is_pressed()

    def alt_is_pressed(self):
        return self._MackieControlComponent__main_script.alt_is_pressed()

    def song(self):
        return self._MackieControlComponent__main_script.song()

    def script_handle(self):
        return self._MackieControlComponent__main_script.handle()

    def application(self):
        return self._MackieControlComponent__main_script.application()

    def send_midi(self, bytes):
        self._MackieControlComponent__main_script.send_midi(bytes)

    def request_rebuild_midi_map(self):
        self._MackieControlComponent__main_script.request_rebuild_midi_map()
    
    # Maus3r
    def log(self, msg):
        self._MackieControlComponent__main_script.show_message(msg)
# okay decompiling C:\ProgramData\Ableton\Live 11 Suite\Resources\MIDI Remote Scripts\MackieControl_UF8\MackieControlComponent.pyc
