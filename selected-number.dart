
void ShowOptionNumberDouble(
    BuildContext context,
    List listItem,
    void Function(int) setValue,
    void Function() resetValue,
    int indexCurrentValue) {
  int value = 0;
  bool isChangesValue = false;
  showDialog<void>(
    context: context,
    // backgroundColor: AppColors.light.white,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(.6),
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        _bodySelectedNumber(listItem, indexCurrentValue,
                            (index) {
                          value = index;
                          _effectSelectionOption();
                          isChangesValue = true;
                        }),
                        _boderDriver(context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(() {
    if (!isChangesValue) {
      setValue(indexCurrentValue - 1);
    } else {
      setValue(value - 1);
    }
    resetValue();
  });
}

void ShowOptionNumberInt(
    BuildContext context,
    void Function(int) setValueOption_1,
    void Function(int) setValueOption_2,
    void Function() resetValue,
    List listOption_1,
    List listOption_2,
    int indexCurrentValueOption_1,
    int indexCurrentValueOption_2) {
  int valueOption_1 = indexCurrentValueOption_1;
  int valueOption_2 = indexCurrentValueOption_2;
  showDialog<void>(
    context: context,
    // backgroundColor: AppColors.light.transparent,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(.6),
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                // height: 300,
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: _bodySelectedNumber(
                                listOption_1, indexCurrentValueOption_1,
                                (value) {
                          _effectSelectionOption();
                          valueOption_1 = value;
                        })),
                        Expanded(
                            child: _bodySelectedNumber(
                                listOption_2, indexCurrentValueOption_2,
                                (value) {
                          _effectSelectionOption();
                          valueOption_2 = value;
                        })),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        alignment: Alignment.center,
                        child: const Text(
                          '~',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    _boderDriver(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(() {
    setValueOption_1(valueOption_1 - 1);
    setValueOption_2(valueOption_2 - 1);
    resetValue();
  });
}
