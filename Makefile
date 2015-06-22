BOARDS = $(shell ls */board/*.brd)
BOARD_ZIPS = $(addsuffix .zip, $(basename $(BOARDS)))

CUR_JOB = panel/current
CUR_DATE = $(shell ls -l $(CUR_JOB) | awk '{print $$11}')

CFG_FILE = $(CUR_JOB)/layout.cfg
DEF_FILE = $(CUR_JOB)/layout.def

CAM_SCR = panel/33each_cam.sh

merge: $(CUR_JOB)/$(CUR_DATE).zip

%.zip: %.brd $(CAM_SCR)
	$(eval BOARD_FILE := $*.brd)
	$(eval BOARD_NAME := $(notdir $*))
	$(eval GERBER_DIR :=  $(dir $*.brd)gerber)
	rm -rf $(GERBER_DIR)/*.*
	bash $(CAM_SCR) $(BOARD_FILE) $(GERBER_DIR)/$(BOARD_NAME)
	mv $(dir $*.brd)gerber.zip $*.zip

all-boards: $(BOARD_ZIPS)

$(CUR_JOB)/$(CUR_DATE).zip: $(BOARD_ZIPS) $(CFG_FILE) $(DEF_FILE)
	for b in $(BOARD_ZIPS); do unzip -o $$b -d $(CUR_JOB)/gerber; done
	echo 'y' | gerbmerge $(CFG_FILE) $(DEF_FILE)
	zip -j $(CUR_JOB)/$(CUR_DATE).zip $(CUR_JOB)/gerber/panel.*

print:
	@echo $(CUR_DATE)
	@echo $(BOARDS)
	@echo $(BOARD_ZIPS)

clean:
	find . -name *.*\#* -exec rm {} \;
	rm -rf */board/*.zip
	rm -rf */board/gerber/*.*
	rm -rf $(CUR_JOB)/gerber/*.*
	rm -rf $(CUR_JOB)/*.zip

.PHONY: clean all-boards print merge
