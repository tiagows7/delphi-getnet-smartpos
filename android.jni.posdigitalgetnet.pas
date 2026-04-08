
unit android.jni.posdigitalgetnet;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JInterpolator = interface;//android.view.animation.Interpolator
  Jposdigital_BuildConfig = interface;//com.getnet.posdigital.BuildConfig
  JIMainService = interface;//com.getnet.posdigital.IMainService
  JIMainService_Default = interface;//com.getnet.posdigital.IMainService$Default
  JIMainService_Stub = interface;//com.getnet.posdigital.IMainService$Stub
  JIMainService_Stub_Proxy = interface;//com.getnet.posdigital.IMainService$Stub$Proxy
  JPosDigital = interface;//com.getnet.posdigital.PosDigital
  JPosDigital_1 = interface;//com.getnet.posdigital.PosDigital$1
  JPosDigital_2 = interface;//com.getnet.posdigital.PosDigital$2
  JPosDigital_3 = interface;//com.getnet.posdigital.PosDigital$3
  JPosDigital_BindCallback = interface;//com.getnet.posdigital.PosDigital$BindCallback
  JPosDigitalRuntimeException = interface;//com.getnet.posdigital.PosDigitalRuntimeException
  JIBeeperService = interface;//com.getnet.posdigital.beeper.IBeeperService
  JIBeeperService_Default = interface;//com.getnet.posdigital.beeper.IBeeperService$Default
  JIBeeperService_Stub = interface;//com.getnet.posdigital.beeper.IBeeperService$Stub
  JIBeeperService_Stub_Proxy = interface;//com.getnet.posdigital.beeper.IBeeperService$Stub$Proxy
  JICameraCallback = interface;//com.getnet.posdigital.camera.ICameraCallback
  JICameraCallback_Default = interface;//com.getnet.posdigital.camera.ICameraCallback$Default
  JICameraCallback_Stub = interface;//com.getnet.posdigital.camera.ICameraCallback$Stub
  JICameraCallback_Stub_Proxy = interface;//com.getnet.posdigital.camera.ICameraCallback$Stub$Proxy
  JICameraService = interface;//com.getnet.posdigital.camera.ICameraService
  JICameraService_Default = interface;//com.getnet.posdigital.camera.ICameraService$Default
  JICameraService_Stub = interface;//com.getnet.posdigital.camera.ICameraService$Stub
  JICameraService_Stub_Proxy = interface;//com.getnet.posdigital.camera.ICameraService$Stub$Proxy
  JCardResponse = interface;//com.getnet.posdigital.card.CardResponse
  JCardResponse_1 = interface;//com.getnet.posdigital.card.CardResponse$1
  JICardCallback = interface;//com.getnet.posdigital.card.ICardCallback
  JICardCallback_Default = interface;//com.getnet.posdigital.card.ICardCallback$Default
  JICardCallback_Stub = interface;//com.getnet.posdigital.card.ICardCallback$Stub
  JICardCallback_Stub_Proxy = interface;//com.getnet.posdigital.card.ICardCallback$Stub$Proxy
  JICardService = interface;//com.getnet.posdigital.card.ICardService
  JICardService_Default = interface;//com.getnet.posdigital.card.ICardService$Default
  JICardService_Stub = interface;//com.getnet.posdigital.card.ICardService$Stub
  JICardService_Stub_Proxy = interface;//com.getnet.posdigital.card.ICardService$Stub$Proxy
  JSearchType = interface;//com.getnet.posdigital.card.SearchType
  JBitmapUtils = interface;//com.getnet.posdigital.extension.BitmapUtils
  Jextension_ViewUtils = interface;//com.getnet.posdigital.extension.ViewUtils
  JIInfoCallback = interface;//com.getnet.posdigital.info.IInfoCallback
  JIInfoCallback_Default = interface;//com.getnet.posdigital.info.IInfoCallback$Default
  JIInfoCallback_Stub = interface;//com.getnet.posdigital.info.IInfoCallback$Stub
  JIInfoCallback_Stub_Proxy = interface;//com.getnet.posdigital.info.IInfoCallback$Stub$Proxy
  JIInfoService = interface;//com.getnet.posdigital.info.IInfoService
  JIInfoService_Default = interface;//com.getnet.posdigital.info.IInfoService$Default
  JIInfoService_Stub = interface;//com.getnet.posdigital.info.IInfoService$Stub
  JIInfoService_Stub_Proxy = interface;//com.getnet.posdigital.info.IInfoService$Stub$Proxy
  JInfoResponse = interface;//com.getnet.posdigital.info.InfoResponse
  JInfoResponse_1 = interface;//com.getnet.posdigital.info.InfoResponse$1
  JILedService = interface;//com.getnet.posdigital.led.ILedService
  JILedService_Default = interface;//com.getnet.posdigital.led.ILedService$Default
  JILedService_Stub = interface;//com.getnet.posdigital.led.ILedService$Stub
  JILedService_Stub_Proxy = interface;//com.getnet.posdigital.led.ILedService$Stub$Proxy
  JAPDUResponse = interface;//com.getnet.posdigital.mifare.APDUResponse
  JAPDUResponse_1 = interface;//com.getnet.posdigital.mifare.APDUResponse$1
  JIMifareActivateCallback = interface;//com.getnet.posdigital.mifare.IMifareActivateCallback
  JIMifareActivateCallback_Default = interface;//com.getnet.posdigital.mifare.IMifareActivateCallback$Default
  JIMifareActivateCallback_Stub = interface;//com.getnet.posdigital.mifare.IMifareActivateCallback$Stub
  JIMifareActivateCallback_Stub_Proxy = interface;//com.getnet.posdigital.mifare.IMifareActivateCallback$Stub$Proxy
  JIMifareCallback = interface;//com.getnet.posdigital.mifare.IMifareCallback
  JIMifareCallback_Default = interface;//com.getnet.posdigital.mifare.IMifareCallback$Default
  JIMifareCallback_Stub = interface;//com.getnet.posdigital.mifare.IMifareCallback$Stub
  JIMifareCallback_Stub_Proxy = interface;//com.getnet.posdigital.mifare.IMifareCallback$Stub$Proxy
  JIMifareService = interface;//com.getnet.posdigital.mifare.IMifareService
  JIMifareService_Default = interface;//com.getnet.posdigital.mifare.IMifareService$Default
  JIMifareService_Stub = interface;//com.getnet.posdigital.mifare.IMifareService$Stub
  JIMifareService_Stub_Proxy = interface;//com.getnet.posdigital.mifare.IMifareService$Stub$Proxy
  JMifareStatus = interface;//com.getnet.posdigital.mifare.MifareStatus
  JAlignMode = interface;//com.getnet.posdigital.printer.AlignMode
  JFontFormat = interface;//com.getnet.posdigital.printer.FontFormat
  JIPrinterCallback = interface;//com.getnet.posdigital.printer.IPrinterCallback
  JIPrinterCallback_Default = interface;//com.getnet.posdigital.printer.IPrinterCallback$Default
  JIPrinterCallback_Stub = interface;//com.getnet.posdigital.printer.IPrinterCallback$Stub
  JIPrinterCallback_Stub_Proxy = interface;//com.getnet.posdigital.printer.IPrinterCallback$Stub$Proxy
  JIPrinterService = interface;//com.getnet.posdigital.printer.IPrinterService
  JIPrinterService_Default = interface;//com.getnet.posdigital.printer.IPrinterService$Default
  JIPrinterService_Stub = interface;//com.getnet.posdigital.printer.IPrinterService$Stub
  JIPrinterService_Stub_Proxy = interface;//com.getnet.posdigital.printer.IPrinterService$Stub$Proxy
  JPrinterStatus = interface;//com.getnet.posdigital.printer.PrinterStatus
  JIStatCallback = interface;//com.getnet.posdigital.stat.IStatCallback
  JIStatCallback_Default = interface;//com.getnet.posdigital.stat.IStatCallback$Default
  JIStatCallback_Stub = interface;//com.getnet.posdigital.stat.IStatCallback$Stub
  JIStatCallback_Stub_Proxy = interface;//com.getnet.posdigital.stat.IStatCallback$Stub$Proxy
  JIStatService = interface;//com.getnet.posdigital.stat.IStatService
  JIStatService_Default = interface;//com.getnet.posdigital.stat.IStatService$Default
  JIStatService_Stub = interface;//com.getnet.posdigital.stat.IStatService$Stub
  JIStatService_Stub_Proxy = interface;//com.getnet.posdigital.stat.IStatService$Stub$Proxy
  JStatResponse = interface;//com.getnet.posdigital.stat.StatResponse
  JStatResponse_1 = interface;//com.getnet.posdigital.stat.StatResponse$1

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;//Deprecated
    {class} procedure addListener(listener: JAnimator_AnimatorListener); cdecl;
    {class} procedure &end; cdecl;
    {class} function getDuration: Int64; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function isRunning: Boolean; cdecl;
    {class} function isStarted: Boolean; cdecl;
    {class} procedure pause; cdecl;
    {class} procedure resume; cdecl;
    {class} function setDuration(duration: Int64): JAnimator; cdecl;
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;
    {class} procedure setupStartValues; cdecl;//Deprecated
    {class} procedure start; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure cancel; cdecl;
    function clone: JAnimator; cdecl;
    function getListeners: JArrayList; cdecl;
    function getStartDelay: Int64; cdecl;
    function isPaused: Boolean; cdecl;
    procedure removeAllListeners; cdecl;
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure setStartDelay(startDelay: Int64); cdecl;//Deprecated
    procedure setTarget(target: JObject); cdecl;//Deprecated
    procedure setupEndValues; cdecl;//Deprecated
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationPause(animation: JAnimator); cdecl;
    procedure onAnimationResume(animation: JAnimator); cdecl;
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;//Deprecated
    {class} function clone: JKeyframe; cdecl;
    {class} function getFraction: Single; cdecl;
    {class} function getValue: JObject; cdecl;//Deprecated
    {class} function hasValue: Boolean; cdecl;//Deprecated
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} procedure setFraction(fraction: Single); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getType: Jlang_Class; cdecl;//Deprecated
    procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;//Deprecated
    procedure setValue(value: JObject); cdecl;//Deprecated
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;//Deprecated
    {class} procedure addChild(parent: JViewGroup; child: JView); cdecl;
    {class} procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure disableTransitionType(transitionType: Integer); cdecl;
    {class} function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;//Deprecated
    {class} function getStagger(transitionType: Integer): Int64; cdecl;//Deprecated
    {class} function getStartDelay(transitionType: Integer): Int64; cdecl;//Deprecated
    {class} function isChangingLayout: Boolean; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;//Deprecated
    {class} procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;//Deprecated
    {class} procedure setDuration(duration: Int64); cdecl; overload;//Deprecated
    {class} procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;//Deprecated
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure enableTransitionType(transitionType: Integer); cdecl;//Deprecated
    function getAnimator(transitionType: Integer): JAnimator; cdecl;//Deprecated
    function getDuration(transitionType: Integer): Int64; cdecl;//Deprecated
    function getTransitionListeners: JList; cdecl;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;//Deprecated
    function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;//Deprecated
    procedure removeChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;//Deprecated
    procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;//Deprecated
    procedure setStagger(transitionType: Integer; duration: Int64); cdecl;//Deprecated
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
    {class} procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;//Deprecated
    {class} procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function clone: JPropertyValuesHolder; cdecl;//Deprecated
    {class} function getPropertyName: JString; cdecl;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    procedure setConverter(converter: JTypeConverter); cdecl;
    procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    procedure setProperty(property_: JProperty); cdecl;
    procedure setPropertyName(propertyName: JString); cdecl;
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;//Deprecated
    {class} procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    function clone: JStateListAnimator; cdecl;
    procedure jumpToCurrentState; cdecl;
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
    {class} function getInterpolation(input: Single): Single; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
    function convert(value: JObject): JObject; cdecl;//Deprecated
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
    {class} function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;//Deprecated
    {class} procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    {class} procedure cancel; cdecl;//Deprecated
    {class} function getAnimatedValue: JObject; cdecl; overload;
    {class} function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;
    {class} function getCurrentPlayTime: Int64; cdecl;
    {class} function getFrameDelay: Int64; cdecl;
    {class} function getRepeatCount: Integer; cdecl;
    {class} function getRepeatMode: Integer; cdecl;
    {class} function getStartDelay: Int64; cdecl;
    {class} procedure removeAllUpdateListeners; cdecl;
    {class} procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    {class} procedure setCurrentPlayTime(playTime: Int64); cdecl;//Deprecated
    {class} function setDuration(duration: Int64): JValueAnimator; cdecl;//Deprecated
    {class} procedure setEvaluator(value: JTypeEvaluator); cdecl;//Deprecated
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;//Deprecated
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;//Deprecated
    {class} procedure setRepeatCount(value: Integer); cdecl;//Deprecated
    {class} procedure start; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    function clone: JValueAnimator; cdecl;
    procedure &end; cdecl;
    function getAnimatedFraction: Single; cdecl;
    function getDuration: Int64; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;
    function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;
    function isRunning: Boolean; cdecl;
    function isStarted: Boolean; cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;//Deprecated
    procedure reverse; cdecl;//Deprecated
    procedure setCurrentFraction(fraction: Single); cdecl;//Deprecated
    procedure setRepeatMode(value: Integer); cdecl;//Deprecated
    procedure setStartDelay(startDelay: Int64); cdecl;//Deprecated
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
    {class} procedure onAnimationUpdate(animation: JValueAnimator); cdecl;
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  Jposdigital_BuildConfigClass = interface(JObjectClass)
    ['{5B0C1C03-1B06-4119-89F7-F39B65B5A946}']
    {class} function _GetBUILD_TYPE: JString; cdecl;
    {class} function _GetDEBUG: Boolean; cdecl;
    {class} function _GetLIBRARY_PACKAGE_NAME: JString; cdecl;
    {class} function init: Jposdigital_BuildConfig; cdecl;//Deprecated
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
  end;

  [JavaSignature('com/getnet/posdigital/BuildConfig')]
  Jposdigital_BuildConfig = interface(JObject)
    ['{263CD30F-C370-4BFD-8174-EA11DFF8F479}']
  end;
  TJposdigital_BuildConfig = class(TJavaGenericImport<Jposdigital_BuildConfigClass, Jposdigital_BuildConfig>) end;

  JIMainServiceClass = interface(JIInterfaceClass)
    ['{B94A6EC2-7F23-45A9-A47F-84B047814A2C}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} function getBeeper: JIBeeperService; cdecl;
    {class} function getCard: JICardService; cdecl;
    {class} function getPrinter: JIPrinterService; cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/IMainService')]
  JIMainService = interface(JIInterface)
    ['{84BF79F1-E447-4118-A050-57860398D41A}']
    function getCamera: JICameraService; cdecl;
    function getInfo: JIInfoService; cdecl;
    function getLed: JILedService; cdecl;
    function getMifare: JIMifareService; cdecl;
    function getStatistic: JIStatService; cdecl;
  end;
  TJIMainService = class(TJavaGenericImport<JIMainServiceClass, JIMainService>) end;

  JIMainService_DefaultClass = interface(JIMainServiceClass)
    ['{D6768541-5AB4-4BA9-8A3B-2ADF56F8703F}']
    {class} function asBinder: JIBinder; cdecl;
    {class} function getCamera: JICameraService; cdecl;
    {class} function getPrinter: JIPrinterService; cdecl;
    {class} function init: JIMainService_Default; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/IMainService$Default')]
  JIMainService_Default = interface(JIMainService)
    ['{FDD4A66C-BFA0-4D30-A1C9-C126313CA8AE}']
    function getBeeper: JIBeeperService; cdecl;
    function getCard: JICardService; cdecl;
    function getInfo: JIInfoService; cdecl;
    function getLed: JILedService; cdecl;
    function getMifare: JIMifareService; cdecl;
    function getStatistic: JIStatService; cdecl;
  end;
  TJIMainService_Default = class(TJavaGenericImport<JIMainService_DefaultClass, JIMainService_Default>) end;

  JIMainService_StubClass = interface(JBinderClass)
    ['{01B9250C-0429-4318-A91A-213D323FD088}']
    {class} function _GetTRANSACTION_getBeeper: Integer; cdecl;
    {class} function _GetTRANSACTION_getCamera: Integer; cdecl;
    {class} function _GetTRANSACTION_getCard: Integer; cdecl;
    {class} function _GetTRANSACTION_getInfo: Integer; cdecl;
    {class} function _GetTRANSACTION_getLed: Integer; cdecl;
    {class} function _GetTRANSACTION_getMifare: Integer; cdecl;
    {class} function _GetTRANSACTION_getPrinter: Integer; cdecl;
    {class} function _GetTRANSACTION_getStatistic: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIMainService; cdecl;
    {class} function getDefaultImpl: JIMainService; cdecl;
    {class} function init: JIMainService_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iMainService: JIMainService): Boolean; cdecl;
    {class} property TRANSACTION_getBeeper: Integer read _GetTRANSACTION_getBeeper;
    {class} property TRANSACTION_getCamera: Integer read _GetTRANSACTION_getCamera;
    {class} property TRANSACTION_getCard: Integer read _GetTRANSACTION_getCard;
    {class} property TRANSACTION_getInfo: Integer read _GetTRANSACTION_getInfo;
    {class} property TRANSACTION_getLed: Integer read _GetTRANSACTION_getLed;
    {class} property TRANSACTION_getMifare: Integer read _GetTRANSACTION_getMifare;
    {class} property TRANSACTION_getPrinter: Integer read _GetTRANSACTION_getPrinter;
    {class} property TRANSACTION_getStatistic: Integer read _GetTRANSACTION_getStatistic;
  end;

  [JavaSignature('com/getnet/posdigital/IMainService$Stub')]
  JIMainService_Stub = interface(JBinder)
    ['{C463A3B1-5C9F-4D49-99D7-4B6700838679}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIMainService_Stub = class(TJavaGenericImport<JIMainService_StubClass, JIMainService_Stub>) end;

  JIMainService_Stub_ProxyClass = interface(JIMainServiceClass)
    ['{8845B9BB-982F-47EF-9A33-06D938B6BA59}']
    {class} function _GetsDefaultImpl: JIMainService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIMainService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function getInfo: JIInfoService; cdecl;
    {class} function getMifare: JIMifareService; cdecl;
    {class} function init(iBinder: JIBinder): JIMainService_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIMainService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/IMainService$Stub$Proxy')]
  JIMainService_Stub_Proxy = interface(JIMainService)
    ['{CA7C4CB0-C3C6-46DA-AE4F-B7C187A3EA8E}']
    function getBeeper: JIBeeperService; cdecl;
    function getCamera: JICameraService; cdecl;
    function getCard: JICardService; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getLed: JILedService; cdecl;
    function getPrinter: JIPrinterService; cdecl;
    function getStatistic: JIStatService; cdecl;
  end;
  TJIMainService_Stub_Proxy = class(TJavaGenericImport<JIMainService_Stub_ProxyClass, JIMainService_Stub_Proxy>) end;

  JPosDigitalClass = interface(JObjectClass)
    ['{AD0DFFC3-2491-49B5-82D6-5A72C9928885}']
    {class} function getInstance: JPosDigital; cdecl;
    {class} function getLed: JILedService; cdecl;
    {class} function getStatistic: JIStatService; cdecl;
    {class} function init: JPosDigital; cdecl;
    {class} function isInitiated: Boolean; cdecl;
    {class} procedure register(context: JContext; bindCallback: JPosDigital_BindCallback); cdecl;
    {class} procedure unregister(context: JContext); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/PosDigital')]
  JPosDigital = interface(JObject)
    ['{47C454EA-AD83-406A-8CC4-EEF594FEFA19}']
    function getBeeper: JIBeeperService; cdecl;
    function getCamera: JICameraService; cdecl;
    function getCard: JICardService; cdecl;
    function getInfo: JIInfoService; cdecl;
    function getMifare: JIMifareService; cdecl;
    function getPrinter: JIPrinterService; cdecl;
  end;
  TJPosDigital = class(TJavaGenericImport<JPosDigitalClass, JPosDigital>) end;

  JPosDigital_1Class = interface(JServiceConnectionClass)
    ['{B7DBCCA8-5136-41EA-845C-96F5C0CD3BF8}']
    {class} function init(bindCallback: JPosDigital_BindCallback): JPosDigital_1; cdecl;
    {class} procedure onServiceConnected(componentName: JComponentName; iBinder: JIBinder); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/PosDigital$1')]
  JPosDigital_1 = interface(JServiceConnection)
    ['{D20A164F-5B65-4B04-8C44-BDCB7E97BD9C}']
    function _Getval$callback: JPosDigital_BindCallback; cdecl;
    procedure onServiceDisconnected(componentName: JComponentName); cdecl;
    property val$callback: JPosDigital_BindCallback read _Getval$callback;
  end;
  TJPosDigital_1 = class(TJavaGenericImport<JPosDigital_1Class, JPosDigital_1>) end;

  JPosDigital_2Class = interface(JBroadcastReceiverClass)
    ['{B08A5861-10B7-41F7-814C-47F523AFCD68}']
    {class} function init: JPosDigital_2; cdecl;
    {class} procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/PosDigital$2')]
  JPosDigital_2 = interface(JBroadcastReceiver)
    ['{C75E25A2-7870-4698-B46C-D1FEB39C69B1}']
  end;
  TJPosDigital_2 = class(TJavaGenericImport<JPosDigital_2Class, JPosDigital_2>) end;

  JPosDigital_3Class = interface(JBroadcastReceiverClass)
    ['{11174C4D-FDC7-4376-877B-A596D92E902A}']
    {class} function _Getval$callback: JPosDigital_BindCallback; cdecl;
    {class} function init(bindCallback: JPosDigital_BindCallback): JPosDigital_3; cdecl;
    {class} procedure onReceive(context: JContext; intent: JIntent); cdecl;
    {class} property val$callback: JPosDigital_BindCallback read _Getval$callback;
  end;

  [JavaSignature('com/getnet/posdigital/PosDigital$3')]
  JPosDigital_3 = interface(JBroadcastReceiver)
    ['{A01F64E7-EB81-4085-A19E-3CD7136F8BD9}']
  end;
  TJPosDigital_3 = class(TJavaGenericImport<JPosDigital_3Class, JPosDigital_3>) end;

  JPosDigital_BindCallbackClass = interface(IJavaClass)
    ['{E8042E78-7960-4DA9-823C-998B8B8F14BB}']
    {class} procedure onConnected; cdecl;
    {class} procedure onError(exception: JException); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/PosDigital$BindCallback')]
  JPosDigital_BindCallback = interface(IJavaInstance)
    ['{661684F6-36DC-40DE-8E60-A747B4FA7E3F}']
    procedure onDisconnected; cdecl;
  end;
  TJPosDigital_BindCallback = class(TJavaGenericImport<JPosDigital_BindCallbackClass, JPosDigital_BindCallback>) end;

  JPosDigitalRuntimeExceptionClass = interface(JRuntimeExceptionClass)
    ['{DF31D72B-638B-435F-BDB6-3A3924F188BF}']
    {class} function init(string_: JString): JPosDigitalRuntimeException; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/PosDigitalRuntimeException')]
  JPosDigitalRuntimeException = interface(JRuntimeException)
    ['{5D5CB48A-80A3-4133-A4DD-798BEE4D178F}']
  end;
  TJPosDigitalRuntimeException = class(TJavaGenericImport<JPosDigitalRuntimeExceptionClass, JPosDigitalRuntimeException>) end;

  JIBeeperServiceClass = interface(JIInterfaceClass)
    ['{3FD92E9F-FD33-4E4D-8648-516B5E26C2D0}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure error; cdecl;
    {class} procedure success; cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/beeper/IBeeperService')]
  JIBeeperService = interface(JIInterface)
    ['{703CD906-5E22-4ADF-82CB-732A081FB116}']
    procedure custom(i: Integer); cdecl;
    procedure digit; cdecl;
    procedure nfc; cdecl;
  end;
  TJIBeeperService = class(TJavaGenericImport<JIBeeperServiceClass, JIBeeperService>) end;

  JIBeeperService_DefaultClass = interface(JIBeeperServiceClass)
    ['{8AF03DB2-1651-43AB-ADD7-25BEE870160C}']
    {class} procedure custom(i: Integer); cdecl;
    {class} function init: JIBeeperService_Default; cdecl;
    {class} procedure success; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/beeper/IBeeperService$Default')]
  JIBeeperService_Default = interface(JIBeeperService)
    ['{3F3B6B1B-28BF-41C6-97AC-E8F0EBC1FD70}']
    function asBinder: JIBinder; cdecl;
    procedure digit; cdecl;
    procedure error; cdecl;
    procedure nfc; cdecl;
  end;
  TJIBeeperService_Default = class(TJavaGenericImport<JIBeeperService_DefaultClass, JIBeeperService_Default>) end;

  JIBeeperService_StubClass = interface(JBinderClass)
    ['{74513A02-C2CF-49D3-AEC5-E0884EF9B1BE}']
    {class} function _GetTRANSACTION_error: Integer; cdecl;
    {class} function _GetTRANSACTION_success: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIBeeperService; cdecl;
    {class} function getDefaultImpl: JIBeeperService; cdecl;
    {class} function init: JIBeeperService_Stub; cdecl;
    {class} function setDefaultImpl(iBeeperService: JIBeeperService): Boolean; cdecl;
    {class} property TRANSACTION_error: Integer read _GetTRANSACTION_error;
    {class} property TRANSACTION_success: Integer read _GetTRANSACTION_success;
  end;

  [JavaSignature('com/getnet/posdigital/beeper/IBeeperService$Stub')]
  JIBeeperService_Stub = interface(JBinder)
    ['{619831F3-3CC9-47C1-8CD9-38B01ED2B76C}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIBeeperService_Stub = class(TJavaGenericImport<JIBeeperService_StubClass, JIBeeperService_Stub>) end;

  JIBeeperService_Stub_ProxyClass = interface(JIBeeperServiceClass)
    ['{1E038411-D66B-4EFE-B911-07E8C5118508}']
    {class} function _GetsDefaultImpl: JIBeeperService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIBeeperService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} procedure digit; cdecl;
    {class} function init(iBinder: JIBinder): JIBeeperService_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIBeeperService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/beeper/IBeeperService$Stub$Proxy')]
  JIBeeperService_Stub_Proxy = interface(JIBeeperService)
    ['{5D4608DB-77A7-4924-836A-95A53A315519}']
    procedure custom(i: Integer); cdecl;
    procedure error; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure nfc; cdecl;
    procedure success; cdecl;
  end;
  TJIBeeperService_Stub_Proxy = class(TJavaGenericImport<JIBeeperService_Stub_ProxyClass, JIBeeperService_Stub_Proxy>) end;

  JICameraCallbackClass = interface(JIInterfaceClass)
    ['{E5EAB834-E7FE-4800-9810-523242ECCFF2}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onSuccess(string_: JString); cdecl;
    {class} procedure onTimeout; cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraCallback')]
  JICameraCallback = interface(JIInterface)
    ['{B13705B7-42EA-4716-ADFB-7DC650417349}']
    procedure onCancel; cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJICameraCallback = class(TJavaGenericImport<JICameraCallbackClass, JICameraCallback>) end;

  JICameraCallback_DefaultClass = interface(JICameraCallbackClass)
    ['{5A35BE70-E0DC-43C4-A5E5-9E710A20AABE}']
    {class} function asBinder: JIBinder; cdecl;
    {class} function init: JICameraCallback_Default; cdecl;
    {class} procedure onSuccess(string_: JString); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraCallback$Default')]
  JICameraCallback_Default = interface(JICameraCallback)
    ['{481954DD-9D9F-4AE1-A2D6-25ABDB2DDEC3}']
    procedure onCancel; cdecl;
    procedure onError(string_: JString); cdecl;
    procedure onTimeout; cdecl;
  end;
  TJICameraCallback_Default = class(TJavaGenericImport<JICameraCallback_DefaultClass, JICameraCallback_Default>) end;

  JICameraCallback_StubClass = interface(JBinderClass)
    ['{A20FC36D-3C14-4A1B-897F-BD6D6E9B823E}']
    {class} function _GetTRANSACTION_onSuccess: Integer; cdecl;
    {class} function _GetTRANSACTION_onTimeout: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JICameraCallback; cdecl;
    {class} function getDefaultImpl: JICameraCallback; cdecl;
    {class} function init: JICameraCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iCameraCallback: JICameraCallback): Boolean; cdecl;
    {class} property TRANSACTION_onSuccess: Integer read _GetTRANSACTION_onSuccess;
    {class} property TRANSACTION_onTimeout: Integer read _GetTRANSACTION_onTimeout;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraCallback$Stub')]
  JICameraCallback_Stub = interface(JBinder)
    ['{3143711E-F75A-415D-BBFB-B515B9418626}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJICameraCallback_Stub = class(TJavaGenericImport<JICameraCallback_StubClass, JICameraCallback_Stub>) end;

  JICameraCallback_Stub_ProxyClass = interface(JICameraCallbackClass)
    ['{A2C29FAA-6C8D-4554-B6CB-2A86DC6E943A}']
    {class} function _GetsDefaultImpl: JICameraCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JICameraCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JICameraCallback_Stub_Proxy; cdecl;
    {class} procedure onCancel; cdecl;
    {class} property sDefaultImpl: JICameraCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraCallback$Stub$Proxy')]
  JICameraCallback_Stub_Proxy = interface(JICameraCallback)
    ['{03622968-3C95-4A92-A1E9-2D0DC53856C6}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onError(string_: JString); cdecl;
    procedure onSuccess(string_: JString); cdecl;
    procedure onTimeout; cdecl;
  end;
  TJICameraCallback_Stub_Proxy = class(TJavaGenericImport<JICameraCallback_Stub_ProxyClass, JICameraCallback_Stub_Proxy>) end;

  JICameraServiceClass = interface(JIInterfaceClass)
    ['{70065C31-0920-40E3-A85F-4A9D84C4D55F}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure readBack(i: Integer; iCameraCallback: JICameraCallback); cdecl;
    {class} procedure readFront(i: Integer; iCameraCallback: JICameraCallback); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraService')]
  JICameraService = interface(JIInterface)
    ['{FB9B7EDF-090E-4B7E-B39A-940B81959690}']
  end;
  TJICameraService = class(TJavaGenericImport<JICameraServiceClass, JICameraService>) end;

  JICameraService_DefaultClass = interface(JICameraServiceClass)
    ['{6B67F4B3-C646-4BAB-A0EA-4915AD7ABC8D}']
    {class} function init: JICameraService_Default; cdecl;
    {class} procedure readFront(i: Integer; iCameraCallback: JICameraCallback); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraService$Default')]
  JICameraService_Default = interface(JICameraService)
    ['{B336F78E-2948-40D2-A2C8-EAE3C1190090}']
    function asBinder: JIBinder; cdecl;
    procedure readBack(i: Integer; iCameraCallback: JICameraCallback); cdecl;
  end;
  TJICameraService_Default = class(TJavaGenericImport<JICameraService_DefaultClass, JICameraService_Default>) end;

  JICameraService_StubClass = interface(JBinderClass)
    ['{8367CE09-F6A0-4034-B92D-9088975B8F64}']
    {class} function _GetTRANSACTION_readBack: Integer; cdecl;
    {class} function _GetTRANSACTION_readFront: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JICameraService; cdecl;
    {class} function getDefaultImpl: JICameraService; cdecl;
    {class} function init: JICameraService_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iCameraService: JICameraService): Boolean; cdecl;
    {class} property TRANSACTION_readBack: Integer read _GetTRANSACTION_readBack;
    {class} property TRANSACTION_readFront: Integer read _GetTRANSACTION_readFront;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraService$Stub')]
  JICameraService_Stub = interface(JBinder)
    ['{C0F8279C-6989-4F5A-8FBE-4FF7CB486998}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJICameraService_Stub = class(TJavaGenericImport<JICameraService_StubClass, JICameraService_Stub>) end;

  JICameraService_Stub_ProxyClass = interface(JICameraServiceClass)
    ['{DAA9A826-2636-4B13-8D89-35CD96A97117}']
    {class} function _GetsDefaultImpl: JICameraService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JICameraService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JICameraService_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JICameraService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/camera/ICameraService$Stub$Proxy')]
  JICameraService_Stub_Proxy = interface(JICameraService)
    ['{99984FF0-4EAB-40BD-8CD9-4D4B245FB4A5}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure readBack(i: Integer; iCameraCallback: JICameraCallback); cdecl;
    procedure readFront(i: Integer; iCameraCallback: JICameraCallback); cdecl;
  end;
  TJICameraService_Stub_Proxy = class(TJavaGenericImport<JICameraService_Stub_ProxyClass, JICameraService_Stub_Proxy>) end;

  JCardResponseClass = interface(JParcelableClass)
    ['{B4CA26F2-811E-4A70-B0CE-E64AB8155AC7}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JCardResponse; cdecl; overload;
    {class} function init(parcel: JParcel): JCardResponse; cdecl; overload;
    {class} procedure setPan(string_: JString); cdecl;
    {class} procedure setTrack1(string_: JString); cdecl;
    {class} procedure setTrack3(string_: JString); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/getnet/posdigital/card/CardResponse')]
  JCardResponse = interface(JParcelable)
    ['{A8431905-46E1-4096-AC13-9B4D39C681A5}']
    function describeContents: Integer; cdecl;
    function getExpireDate: JString; cdecl;
    function getPan: JString; cdecl;
    function getServiceCode: JString; cdecl;
    function getTrack1: JString; cdecl;
    function getTrack2: JString; cdecl;
    function getTrack3: JString; cdecl;
    function getType: JString; cdecl;
    procedure setExpireDate(string_: JString); cdecl;
    procedure setServiceCode(string_: JString); cdecl;
    procedure setTrack2(string_: JString); cdecl;
    procedure setType(string_: JString); cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJCardResponse = class(TJavaGenericImport<JCardResponseClass, JCardResponse>) end;

  JCardResponse_1Class = interface(JParcelable_CreatorClass)
    ['{B2A0FD8C-1674-42B8-9A99-88D9C297DAB8}']
    {class} function createFromParcel(parcel: JParcel): JCardResponse; cdecl;
    {class} function init: JCardResponse_1; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/card/CardResponse$1')]
  JCardResponse_1 = interface(JParcelable_Creator)
    ['{65B8094C-5B40-4F0B-99F4-F34CA80D07B4}']
    function newArray(i: Integer): TJavaObjectArray<JCardResponse>; cdecl;
  end;
  TJCardResponse_1 = class(TJavaGenericImport<JCardResponse_1Class, JCardResponse_1>) end;

  JICardCallbackClass = interface(JIInterfaceClass)
    ['{F566AC5E-B989-4315-A9AF-4AF19F3D5DCD}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onCard(cardResponse: JCardResponse); cdecl;
    {class} procedure onMessage(string_: JString); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardCallback')]
  JICardCallback = interface(JIInterface)
    ['{50D7FDA8-37E4-4246-9987-2FEB7B309550}']
    procedure onError(string_: JString); cdecl;
  end;
  TJICardCallback = class(TJavaGenericImport<JICardCallbackClass, JICardCallback>) end;

  JICardCallback_DefaultClass = interface(JICardCallbackClass)
    ['{59C32D80-91C1-445A-8957-757BE430610E}']
    {class} function init: JICardCallback_Default; cdecl;
    {class} procedure onCard(cardResponse: JCardResponse); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardCallback$Default')]
  JICardCallback_Default = interface(JICardCallback)
    ['{4805A6AF-D18F-46AA-A575-37AE639AB8F8}']
    function asBinder: JIBinder; cdecl;
    procedure onError(string_: JString); cdecl;
    procedure onMessage(string_: JString); cdecl;
  end;
  TJICardCallback_Default = class(TJavaGenericImport<JICardCallback_DefaultClass, JICardCallback_Default>) end;

  JICardCallback_StubClass = interface(JBinderClass)
    ['{B23B3039-C32E-4A71-B072-DA57F41F3851}']
    {class} function _GetTRANSACTION_onCard: Integer; cdecl;
    {class} function _GetTRANSACTION_onMessage: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JICardCallback; cdecl;
    {class} function getDefaultImpl: JICardCallback; cdecl;
    {class} function init: JICardCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iCardCallback: JICardCallback): Boolean; cdecl;
    {class} property TRANSACTION_onCard: Integer read _GetTRANSACTION_onCard;
    {class} property TRANSACTION_onMessage: Integer read _GetTRANSACTION_onMessage;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardCallback$Stub')]
  JICardCallback_Stub = interface(JBinder)
    ['{1941BEE1-228E-4FA6-80F0-77B32A31379E}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJICardCallback_Stub = class(TJavaGenericImport<JICardCallback_StubClass, JICardCallback_Stub>) end;

  JICardCallback_Stub_ProxyClass = interface(JICardCallbackClass)
    ['{E742B659-3D98-4386-AE00-17DC589217F1}']
    {class} function _GetsDefaultImpl: JICardCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JICardCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JICardCallback_Stub_Proxy; cdecl;
    {class} procedure onError(string_: JString); cdecl;
    {class} property sDefaultImpl: JICardCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardCallback$Stub$Proxy')]
  JICardCallback_Stub_Proxy = interface(JICardCallback)
    ['{FFD633F6-2FD3-4F7A-AE77-B5118752AAC5}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onCard(cardResponse: JCardResponse); cdecl;
    procedure onMessage(string_: JString); cdecl;
  end;
  TJICardCallback_Stub_Proxy = class(TJavaGenericImport<JICardCallback_Stub_ProxyClass, JICardCallback_Stub_Proxy>) end;

  JICardServiceClass = interface(JIInterfaceClass)
    ['{6DE4664A-D5ED-45F2-9A25-4E8759303B4F}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure searchChip(l: Int64; iCardCallback: JICardCallback); cdecl;
    {class} procedure searchMag(l: Int64; iCardCallback: JICardCallback); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardService')]
  JICardService = interface(JIInterface)
    ['{C2B98A62-09F2-4959-9FF4-6F85C1C710D7}']
    procedure search(l: Int64; string_: TJavaObjectArray<JString>; iCardCallback: JICardCallback); cdecl;
    procedure searchNFC(l: Int64; iCardCallback: JICardCallback); cdecl;
    procedure stopAllReaders; cdecl;
  end;
  TJICardService = class(TJavaGenericImport<JICardServiceClass, JICardService>) end;

  JICardService_DefaultClass = interface(JICardServiceClass)
    ['{0BF449A3-66FE-48A6-BCD2-84247343FBBF}']
    {class} function init: JICardService_Default; cdecl;
    {class} procedure searchMag(l: Int64; iCardCallback: JICardCallback); cdecl;
    {class} procedure stopAllReaders; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardService$Default')]
  JICardService_Default = interface(JICardService)
    ['{1DB1DFFD-701E-4EDC-BF71-CA59EC074BE6}']
    function asBinder: JIBinder; cdecl;
    procedure search(l: Int64; string_: TJavaObjectArray<JString>; iCardCallback: JICardCallback); cdecl;
    procedure searchChip(l: Int64; iCardCallback: JICardCallback); cdecl;
    procedure searchNFC(l: Int64; iCardCallback: JICardCallback); cdecl;
  end;
  TJICardService_Default = class(TJavaGenericImport<JICardService_DefaultClass, JICardService_Default>) end;

  JICardService_StubClass = interface(JBinderClass)
    ['{CA80183C-21A8-402F-B78C-15B08952012A}']
    {class} function _GetTRANSACTION_searchChip: Integer; cdecl;
    {class} function _GetTRANSACTION_searchMag: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JICardService; cdecl;
    {class} function getDefaultImpl: JICardService; cdecl;
    {class} function init: JICardService_Stub; cdecl;
    {class} function setDefaultImpl(iCardService: JICardService): Boolean; cdecl;
    {class} property TRANSACTION_searchChip: Integer read _GetTRANSACTION_searchChip;
    {class} property TRANSACTION_searchMag: Integer read _GetTRANSACTION_searchMag;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardService$Stub')]
  JICardService_Stub = interface(JBinder)
    ['{DD32C102-4544-4FC3-AC87-3F2F9FB5BF66}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJICardService_Stub = class(TJavaGenericImport<JICardService_StubClass, JICardService_Stub>) end;

  JICardService_Stub_ProxyClass = interface(JICardServiceClass)
    ['{B67ACC2F-783C-4C92-9A8D-3F2CA787EC14}']
    {class} function _GetsDefaultImpl: JICardService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JICardService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JICardService_Stub_Proxy; cdecl;
    {class} procedure searchNFC(l: Int64; iCardCallback: JICardCallback); cdecl;
    {class} property sDefaultImpl: JICardService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/card/ICardService$Stub$Proxy')]
  JICardService_Stub_Proxy = interface(JICardService)
    ['{36BAA6F8-4633-4FF5-8B9E-C697C128DDF7}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure search(l: Int64; string_: TJavaObjectArray<JString>; iCardCallback: JICardCallback); cdecl;
    procedure searchChip(l: Int64; iCardCallback: JICardCallback); cdecl;
    procedure searchMag(l: Int64; iCardCallback: JICardCallback); cdecl;
    procedure stopAllReaders; cdecl;
  end;
  TJICardService_Stub_Proxy = class(TJavaGenericImport<JICardService_Stub_ProxyClass, JICardService_Stub_Proxy>) end;

  JSearchTypeClass = interface(JObjectClass)
    ['{56735E00-AA6A-401D-A255-D9A233B6C2CB}']
    {class} function _GetCHIP: JString; cdecl;
    {class} function _GetMAG: JString; cdecl;
    {class} function _GetNFC: JString; cdecl;
    {class} property CHIP: JString read _GetCHIP;
    {class} property MAG: JString read _GetMAG;
    {class} property NFC: JString read _GetNFC;
  end;

  [JavaSignature('com/getnet/posdigital/card/SearchType')]
  JSearchType = interface(JObject)
    ['{AF2E2420-95BE-4A77-B0D7-74ABC247128F}']
  end;
  TJSearchType = class(TJavaGenericImport<JSearchTypeClass, JSearchType>) end;

  JBitmapUtilsClass = interface(JObjectClass)
    ['{D718A807-956D-42A5-9008-71B7D912CB69}']
    {class} function convertToByteArray(bitmap: JBitmap): TJavaArray<Byte>; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/extension/BitmapUtils')]
  JBitmapUtils = interface(JObject)
    ['{4DFEABEB-87A8-4B41-A1B0-9D9279FE0FA1}']
  end;
  TJBitmapUtils = class(TJavaGenericImport<JBitmapUtilsClass, JBitmapUtils>) end;

  Jextension_ViewUtilsClass = interface(JObjectClass)
    ['{8B1E84E2-5BDF-4FFE-BE7B-D8207C47213A}']
    {class} function convertToBitmap(view: JView): JBitmap; cdecl;
    {class} function init: Jextension_ViewUtils; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/extension/ViewUtils')]
  Jextension_ViewUtils = interface(JObject)
    ['{30858E08-8ECD-43E5-B76D-9999BC605762}']
  end;
  TJextension_ViewUtils = class(TJavaGenericImport<Jextension_ViewUtilsClass, Jextension_ViewUtils>) end;

  JIInfoCallbackClass = interface(JIInterfaceClass)
    ['{71184A2F-C2E4-44F0-8787-FD72D63CBBC6}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onError(string_: JString); cdecl;
    {class} procedure onInfo(infoResponse: JInfoResponse); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoCallback')]
  JIInfoCallback = interface(JIInterface)
    ['{049AFA0C-E796-4032-A06D-C2D5855A2F8D}']
  end;
  TJIInfoCallback = class(TJavaGenericImport<JIInfoCallbackClass, JIInfoCallback>) end;

  JIInfoCallback_DefaultClass = interface(JIInfoCallbackClass)
    ['{BDEE64C3-A368-4BAC-AFC9-C9A69ADB33EA}']
    {class} function init: JIInfoCallback_Default; cdecl;
    {class} procedure onInfo(infoResponse: JInfoResponse); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoCallback$Default')]
  JIInfoCallback_Default = interface(JIInfoCallback)
    ['{9C5796B0-1342-4E08-B952-A906F4D259C0}']
    function asBinder: JIBinder; cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJIInfoCallback_Default = class(TJavaGenericImport<JIInfoCallback_DefaultClass, JIInfoCallback_Default>) end;

  JIInfoCallback_StubClass = interface(JBinderClass)
    ['{FE69432B-9D1A-44DE-B447-EBF0382C7597}']
    {class} function _GetTRANSACTION_onError: Integer; cdecl;
    {class} function _GetTRANSACTION_onInfo: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIInfoCallback; cdecl;
    {class} function getDefaultImpl: JIInfoCallback; cdecl;
    {class} function init: JIInfoCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iInfoCallback: JIInfoCallback): Boolean; cdecl;
    {class} property TRANSACTION_onError: Integer read _GetTRANSACTION_onError;
    {class} property TRANSACTION_onInfo: Integer read _GetTRANSACTION_onInfo;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoCallback$Stub')]
  JIInfoCallback_Stub = interface(JBinder)
    ['{162D2A09-273A-4F47-B836-7465708CED15}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIInfoCallback_Stub = class(TJavaGenericImport<JIInfoCallback_StubClass, JIInfoCallback_Stub>) end;

  JIInfoCallback_Stub_ProxyClass = interface(JIInfoCallbackClass)
    ['{928645C4-8659-45BF-9DE5-29FFCF74EE0A}']
    {class} function _GetsDefaultImpl: JIInfoCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIInfoCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIInfoCallback_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIInfoCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoCallback$Stub$Proxy')]
  JIInfoCallback_Stub_Proxy = interface(JIInfoCallback)
    ['{D118F94F-758C-4C96-8C09-2F17EDC50ED1}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onError(string_: JString); cdecl;
    procedure onInfo(infoResponse: JInfoResponse); cdecl;
  end;
  TJIInfoCallback_Stub_Proxy = class(TJavaGenericImport<JIInfoCallback_Stub_ProxyClass, JIInfoCallback_Stub_Proxy>) end;

  JIInfoServiceClass = interface(JIInterfaceClass)
    ['{E503DF1F-5B1C-492B-A7ED-2A33EA9CC48F}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure info(iInfoCallback: JIInfoCallback); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoService')]
  JIInfoService = interface(JIInterface)
    ['{7B045DA5-4E4D-4157-9860-662973C2E97A}']
  end;
  TJIInfoService = class(TJavaGenericImport<JIInfoServiceClass, JIInfoService>) end;

  JIInfoService_DefaultClass = interface(JIInfoServiceClass)
    ['{A482C962-AB4E-4267-9F3A-CA9D77D0990D}']
    {class} procedure info(iInfoCallback: JIInfoCallback); cdecl;
    {class} function init: JIInfoService_Default; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoService$Default')]
  JIInfoService_Default = interface(JIInfoService)
    ['{4BC5A2C4-C588-4510-A95F-3BFCA04AAB11}']
    function asBinder: JIBinder; cdecl;
  end;
  TJIInfoService_Default = class(TJavaGenericImport<JIInfoService_DefaultClass, JIInfoService_Default>) end;

  JIInfoService_StubClass = interface(JBinderClass)
    ['{2A9795CD-FF27-4A53-B606-8555D1FEDDC8}']
    {class} function _GetTRANSACTION_info: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIInfoService; cdecl;
    {class} function getDefaultImpl: JIInfoService; cdecl;
    {class} function init: JIInfoService_Stub; cdecl;
    {class} function setDefaultImpl(iInfoService: JIInfoService): Boolean; cdecl;
    {class} property TRANSACTION_info: Integer read _GetTRANSACTION_info;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoService$Stub')]
  JIInfoService_Stub = interface(JBinder)
    ['{7ABFD476-D7A0-41B5-A761-BE2894A87D1C}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIInfoService_Stub = class(TJavaGenericImport<JIInfoService_StubClass, JIInfoService_Stub>) end;

  JIInfoService_Stub_ProxyClass = interface(JIInfoServiceClass)
    ['{45E836F5-88B4-4CE6-9EE5-B3FB9BE3E59B}']
    {class} function _GetsDefaultImpl: JIInfoService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIInfoService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIInfoService_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIInfoService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/info/IInfoService$Stub$Proxy')]
  JIInfoService_Stub_Proxy = interface(JIInfoService)
    ['{AB511D7C-8614-4DB1-84EF-85600EAF5E43}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure info(iInfoCallback: JIInfoCallback); cdecl;
  end;
  TJIInfoService_Stub_Proxy = class(TJavaGenericImport<JIInfoService_Stub_ProxyClass, JIInfoService_Stub_Proxy>) end;

  JInfoResponseClass = interface(JParcelableClass)
    ['{F28D96CC-B05B-4245-8C1F-C9F58F6E192E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JInfoResponse; cdecl; overload;
    {class} function init(parcel: JParcel): JInfoResponse; cdecl; overload;
    {class} procedure setAndroidOSVersion(string_: JString); cdecl;
    {class} procedure setOsVersion(string_: JString); cdecl;
    {class} procedure setPsamId(string_: JString); cdecl;
    {class} procedure setSdkVersion(string_: JString); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/getnet/posdigital/info/InfoResponse')]
  JInfoResponse = interface(JParcelable)
    ['{8BB6B03F-99B3-408E-B741-6E6958D3E574}']
    function describeContents: Integer; cdecl;
    function getAndroidKernelVersion: JString; cdecl;
    function getAndroidOSVersion: JString; cdecl;
    function getBcVersion: JString; cdecl;
    function getFirmwareVersion: JString; cdecl;
    function getHardWareSn: JString; cdecl;
    function getHardwareVersion: JString; cdecl;
    function getIccid: JString; cdecl;
    function getImei: JString; cdecl;
    function getImsi: JString; cdecl;
    function getManufacture: JString; cdecl;
    function getModel: JString; cdecl;
    function getOsVersion: JString; cdecl;
    function getPsamId: JString; cdecl;
    function getRomVersion: JString; cdecl;
    function getSdkVersion: JString; cdecl;
    function getSerialNumber: JString; cdecl;
    procedure setAndroidKernelVersion(string_: JString); cdecl;
    procedure setBcVersion(string_: JString); cdecl;
    procedure setFirmwareVersion(string_: JString); cdecl;
    procedure setHardWareSn(string_: JString); cdecl;
    procedure setHardwareVersion(string_: JString); cdecl;
    procedure setIccid(string_: JString); cdecl;
    procedure setImei(string_: JString); cdecl;
    procedure setImsi(string_: JString); cdecl;
    procedure setManufacture(string_: JString); cdecl;
    procedure setModel(string_: JString); cdecl;
    procedure setRomVersion(string_: JString); cdecl;
    procedure setSerialNumber(string_: JString); cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJInfoResponse = class(TJavaGenericImport<JInfoResponseClass, JInfoResponse>) end;

  JInfoResponse_1Class = interface(JParcelable_CreatorClass)
    ['{307D3D52-F6D9-4A34-A07E-FFD8A97D145F}']
    {class} function createFromParcel(parcel: JParcel): JInfoResponse; cdecl;
    {class} function init: JInfoResponse_1; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/info/InfoResponse$1')]
  JInfoResponse_1 = interface(JParcelable_Creator)
    ['{E37FA983-BDC5-493C-8230-087AD3BB9059}']
    function newArray(i: Integer): TJavaObjectArray<JInfoResponse>; cdecl;
  end;
  TJInfoResponse_1 = class(TJavaGenericImport<JInfoResponse_1Class, JInfoResponse_1>) end;

  JILedServiceClass = interface(JIInterfaceClass)
    ['{1615C8DD-BF58-45C1-9E8B-61EB062F221E}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure turnOffAll; cdecl;
    {class} procedure turnOffBlue; cdecl;
    {class} procedure turnOffGreen; cdecl;
    {class} procedure turnOnAll; cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/led/ILedService')]
  JILedService = interface(JIInterface)
    ['{F0C2BFAF-EB74-4EE1-B87E-31F4D4F63A22}']
    procedure turnOffRed; cdecl;
    procedure turnOffYellow; cdecl;
    procedure turnOnBlue; cdecl;
    procedure turnOnGreen; cdecl;
    procedure turnOnRed; cdecl;
    procedure turnOnYellow; cdecl;
  end;
  TJILedService = class(TJavaGenericImport<JILedServiceClass, JILedService>) end;

  JILedService_DefaultClass = interface(JILedServiceClass)
    ['{ED53B859-CCCA-4250-BE02-B83368F23E7B}']
    {class} function init: JILedService_Default; cdecl;
    {class} procedure turnOnAll; cdecl;
    {class} procedure turnOnBlue; cdecl;
    {class} procedure turnOnGreen; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/led/ILedService$Default')]
  JILedService_Default = interface(JILedService)
    ['{0B3DB30A-67F3-4AED-A5A9-16F719B6491A}']
    function asBinder: JIBinder; cdecl;
    procedure turnOffAll; cdecl;
    procedure turnOffBlue; cdecl;
    procedure turnOffGreen; cdecl;
    procedure turnOffRed; cdecl;
    procedure turnOffYellow; cdecl;
    procedure turnOnRed; cdecl;
    procedure turnOnYellow; cdecl;
  end;
  TJILedService_Default = class(TJavaGenericImport<JILedService_DefaultClass, JILedService_Default>) end;

  JILedService_StubClass = interface(JBinderClass)
    ['{B0E5D43D-B6B2-4A5A-94B9-4B33F5C8E682}']
    {class} function _GetTRANSACTION_turnOffAll: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOffBlue: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOffGreen: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOffRed: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOffYellow: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOnAll: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOnBlue: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOnGreen: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOnRed: Integer; cdecl;
    {class} function _GetTRANSACTION_turnOnYellow: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JILedService; cdecl;
    {class} function getDefaultImpl: JILedService; cdecl;
    {class} function init: JILedService_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iLedService: JILedService): Boolean; cdecl;
    {class} property TRANSACTION_turnOffAll: Integer read _GetTRANSACTION_turnOffAll;
    {class} property TRANSACTION_turnOffBlue: Integer read _GetTRANSACTION_turnOffBlue;
    {class} property TRANSACTION_turnOffGreen: Integer read _GetTRANSACTION_turnOffGreen;
    {class} property TRANSACTION_turnOffRed: Integer read _GetTRANSACTION_turnOffRed;
    {class} property TRANSACTION_turnOffYellow: Integer read _GetTRANSACTION_turnOffYellow;
    {class} property TRANSACTION_turnOnAll: Integer read _GetTRANSACTION_turnOnAll;
    {class} property TRANSACTION_turnOnBlue: Integer read _GetTRANSACTION_turnOnBlue;
    {class} property TRANSACTION_turnOnGreen: Integer read _GetTRANSACTION_turnOnGreen;
    {class} property TRANSACTION_turnOnRed: Integer read _GetTRANSACTION_turnOnRed;
    {class} property TRANSACTION_turnOnYellow: Integer read _GetTRANSACTION_turnOnYellow;
  end;

  [JavaSignature('com/getnet/posdigital/led/ILedService$Stub')]
  JILedService_Stub = interface(JBinder)
    ['{BD4EF428-2D96-412F-8540-456045A9AF8C}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJILedService_Stub = class(TJavaGenericImport<JILedService_StubClass, JILedService_Stub>) end;

  JILedService_Stub_ProxyClass = interface(JILedServiceClass)
    ['{45AA32A8-E335-4A7F-927E-FA14DC028D59}']
    {class} function _GetsDefaultImpl: JILedService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JILedService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JILedService_Stub_Proxy; cdecl;
    {class} procedure turnOnRed; cdecl;
    {class} procedure turnOnYellow; cdecl;
    {class} property sDefaultImpl: JILedService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/led/ILedService$Stub$Proxy')]
  JILedService_Stub_Proxy = interface(JILedService)
    ['{0928EC09-FC1E-445D-A263-98949BE4BCA2}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure turnOffAll; cdecl;
    procedure turnOffBlue; cdecl;
    procedure turnOffGreen; cdecl;
    procedure turnOffRed; cdecl;
    procedure turnOffYellow; cdecl;
    procedure turnOnAll; cdecl;
    procedure turnOnBlue; cdecl;
    procedure turnOnGreen; cdecl;
  end;
  TJILedService_Stub_Proxy = class(TJavaGenericImport<JILedService_Stub_ProxyClass, JILedService_Stub_Proxy>) end;

  JAPDUResponseClass = interface(JParcelableClass)
    ['{6DEED3DB-F96C-4692-8B54-094830103F63}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JAPDUResponse; cdecl; overload;
    {class} function init(parcel: JParcel): JAPDUResponse; cdecl; overload;
    {class} procedure setApduRet(i: Integer); cdecl;
    {class} procedure setSw1(b: Byte); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/APDUResponse')]
  JAPDUResponse = interface(JParcelable)
    ['{BE484CF1-3430-4576-A4B3-AD7AD5C41A09}']
    function describeContents: Integer; cdecl;
    function getApduRet: Integer; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getSw1: Byte; cdecl;
    function getSw2: Byte; cdecl;
    procedure setData(b: TJavaArray<Byte>); cdecl;
    procedure setSw2(b: Byte); cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJAPDUResponse = class(TJavaGenericImport<JAPDUResponseClass, JAPDUResponse>) end;

  JAPDUResponse_1Class = interface(JParcelable_CreatorClass)
    ['{CCAC6AEC-2AE6-426A-9D72-74617F94E139}']
    {class} function createFromParcel(parcel: JParcel): JAPDUResponse; cdecl;
    {class} function init: JAPDUResponse_1; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/APDUResponse$1')]
  JAPDUResponse_1 = interface(JParcelable_Creator)
    ['{84FE61B1-9151-456B-B69B-18FBFD6EABEB}']
    function newArray(i: Integer): TJavaObjectArray<JAPDUResponse>; cdecl;
  end;
  TJAPDUResponse_1 = class(TJavaGenericImport<JAPDUResponse_1Class, JAPDUResponse_1>) end;

  JIMifareActivateCallbackClass = interface(JIInterfaceClass)
    ['{434D5CCD-82B0-4CF6-A2C7-EE7505057CB5}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onActivate(b: TJavaArray<Byte>); cdecl;
    {class} procedure onError(string_: JString); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareActivateCallback')]
  JIMifareActivateCallback = interface(JIInterface)
    ['{4A874F13-41D6-41AB-A0C4-7338BDD20A45}']
  end;
  TJIMifareActivateCallback = class(TJavaGenericImport<JIMifareActivateCallbackClass, JIMifareActivateCallback>) end;

  JIMifareActivateCallback_DefaultClass = interface(JIMifareActivateCallbackClass)
    ['{46E2A6A1-508D-49CF-946B-CFDC9C24315B}']
    {class} function init: JIMifareActivateCallback_Default; cdecl;
    {class} procedure onActivate(b: TJavaArray<Byte>); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareActivateCallback$Default')]
  JIMifareActivateCallback_Default = interface(JIMifareActivateCallback)
    ['{ABFF8A21-8584-49A7-9785-BB7085F4B77B}']
    function asBinder: JIBinder; cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJIMifareActivateCallback_Default = class(TJavaGenericImport<JIMifareActivateCallback_DefaultClass, JIMifareActivateCallback_Default>) end;

  JIMifareActivateCallback_StubClass = interface(JBinderClass)
    ['{5DFBDE61-23A5-40E1-BFA9-611C9051C353}']
    {class} function _GetTRANSACTION_onActivate: Integer; cdecl;
    {class} function _GetTRANSACTION_onError: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIMifareActivateCallback; cdecl;
    {class} function getDefaultImpl: JIMifareActivateCallback; cdecl;
    {class} function init: JIMifareActivateCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iMifareActivateCallback: JIMifareActivateCallback): Boolean; cdecl;
    {class} property TRANSACTION_onActivate: Integer read _GetTRANSACTION_onActivate;
    {class} property TRANSACTION_onError: Integer read _GetTRANSACTION_onError;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareActivateCallback$Stub')]
  JIMifareActivateCallback_Stub = interface(JBinder)
    ['{537E905C-0C7E-4045-8394-3FE2FD5ECE56}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIMifareActivateCallback_Stub = class(TJavaGenericImport<JIMifareActivateCallback_StubClass, JIMifareActivateCallback_Stub>) end;

  JIMifareActivateCallback_Stub_ProxyClass = interface(JIMifareActivateCallbackClass)
    ['{F45DBDC7-3BB3-4F4A-8872-E7A8223EA753}']
    {class} function _GetsDefaultImpl: JIMifareActivateCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIMifareActivateCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIMifareActivateCallback_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIMifareActivateCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareActivateCallback$Stub$Proxy')]
  JIMifareActivateCallback_Stub_Proxy = interface(JIMifareActivateCallback)
    ['{A6E99634-CFEA-44A1-82A2-157AB6692A98}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onActivate(b: TJavaArray<Byte>); cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJIMifareActivateCallback_Stub_Proxy = class(TJavaGenericImport<JIMifareActivateCallback_Stub_ProxyClass, JIMifareActivateCallback_Stub_Proxy>) end;

  JIMifareCallbackClass = interface(JIInterfaceClass)
    ['{8F009D5C-AE0B-428A-ADF6-EA6AD0BF7889}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onCard(i: Integer); cdecl;
    {class} procedure onError(string_: JString); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareCallback')]
  JIMifareCallback = interface(JIInterface)
    ['{B1DA546D-E412-4ABB-A1B4-4D5E6CA7F327}']
  end;
  TJIMifareCallback = class(TJavaGenericImport<JIMifareCallbackClass, JIMifareCallback>) end;

  JIMifareCallback_DefaultClass = interface(JIMifareCallbackClass)
    ['{1028C986-DCAA-4150-85B1-3A4F1988411F}']
    {class} function init: JIMifareCallback_Default; cdecl;
    {class} procedure onCard(i: Integer); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareCallback$Default')]
  JIMifareCallback_Default = interface(JIMifareCallback)
    ['{ED83005D-489C-4A0E-9538-55CAB958A795}']
    function asBinder: JIBinder; cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJIMifareCallback_Default = class(TJavaGenericImport<JIMifareCallback_DefaultClass, JIMifareCallback_Default>) end;

  JIMifareCallback_StubClass = interface(JBinderClass)
    ['{3EA86574-B688-433A-8169-2DA7A7B20E2E}']
    {class} function _GetTRANSACTION_onCard: Integer; cdecl;
    {class} function _GetTRANSACTION_onError: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIMifareCallback; cdecl;
    {class} function getDefaultImpl: JIMifareCallback; cdecl;
    {class} function init: JIMifareCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iMifareCallback: JIMifareCallback): Boolean; cdecl;
    {class} property TRANSACTION_onCard: Integer read _GetTRANSACTION_onCard;
    {class} property TRANSACTION_onError: Integer read _GetTRANSACTION_onError;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareCallback$Stub')]
  JIMifareCallback_Stub = interface(JBinder)
    ['{2547EBA0-11D7-43D3-B040-B86DCA695193}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIMifareCallback_Stub = class(TJavaGenericImport<JIMifareCallback_StubClass, JIMifareCallback_Stub>) end;

  JIMifareCallback_Stub_ProxyClass = interface(JIMifareCallbackClass)
    ['{9806B6F5-5F46-49EC-B867-27E8E57F30E7}']
    {class} function _GetsDefaultImpl: JIMifareCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIMifareCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIMifareCallback_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIMifareCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareCallback$Stub$Proxy')]
  JIMifareCallback_Stub_Proxy = interface(JIMifareCallback)
    ['{68A6D985-2B81-4D83-B2F6-14A2161D173E}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onCard(i: Integer); cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJIMifareCallback_Stub_Proxy = class(TJavaGenericImport<JIMifareCallback_Stub_ProxyClass, JIMifareCallback_Stub_Proxy>) end;

  JIMifareServiceClass = interface(JIInterfaceClass)
    ['{C86FE77D-B56F-4FA2-AAE6-6317B86DCB1F}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} function authenticateSectorWithKeyA(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    {class} procedure close; cdecl;
    {class} function readBlock(i: Integer): JString; cdecl;
    {class} procedure searchCard(iMifareCallback: JIMifareCallback); cdecl;
    {class} procedure searchCardAndActivate(iMifareActivateCallback: JIMifareActivateCallback); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareService')]
  JIMifareService = interface(JIInterface)
    ['{8A677A61-4386-4744-BB88-21536DA7A863}']
    function activate(i: Integer): Integer; cdecl;
    function authenticateBlockWithKeyA(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function authenticateBlockWithKeyB(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function authenticateSectorWithKeyB(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function decrement(i: Integer; i1: Integer): Integer; cdecl;
    function exchangeAPDU(b: TJavaArray<Byte>): JAPDUResponse; cdecl;
    function getCardSerialNo(i: Integer): JString; cdecl;
    procedure halt; cdecl;
    function increment(i: Integer; i1: Integer): Integer; cdecl;
    function isExist: Boolean; cdecl;
    function restore(i: Integer): Integer; cdecl;
    function transfer(i: Integer): Integer; cdecl;
    function writeBlock(i: Integer; string_: JString): Integer; cdecl;
  end;
  TJIMifareService = class(TJavaGenericImport<JIMifareServiceClass, JIMifareService>) end;

  JIMifareService_DefaultClass = interface(JIMifareServiceClass)
    ['{3C2A07D8-CDC2-4D3B-955C-272A64FB64D9}']
    {class} function authenticateBlockWithKeyB(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    {class} function getCardSerialNo(i: Integer): JString; cdecl;
    {class} function init: JIMifareService_Default; cdecl;
    {class} function isExist: Boolean; cdecl;
    {class} procedure searchCard(iMifareCallback: JIMifareCallback); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareService$Default')]
  JIMifareService_Default = interface(JIMifareService)
    ['{E95AD36B-E621-4B84-AF74-58927C0D76D9}']
    function activate(i: Integer): Integer; cdecl;
    function asBinder: JIBinder; cdecl;
    function authenticateBlockWithKeyA(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function authenticateSectorWithKeyA(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function authenticateSectorWithKeyB(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    procedure close; cdecl;
    function decrement(i: Integer; i1: Integer): Integer; cdecl;
    function exchangeAPDU(b: TJavaArray<Byte>): JAPDUResponse; cdecl;
    procedure halt; cdecl;
    function increment(i: Integer; i1: Integer): Integer; cdecl;
    function readBlock(i: Integer): JString; cdecl;
    function restore(i: Integer): Integer; cdecl;
    procedure searchCardAndActivate(iMifareActivateCallback: JIMifareActivateCallback); cdecl;
    function transfer(i: Integer): Integer; cdecl;
    function writeBlock(i: Integer; string_: JString): Integer; cdecl;
  end;
  TJIMifareService_Default = class(TJavaGenericImport<JIMifareService_DefaultClass, JIMifareService_Default>) end;

  JIMifareService_StubClass = interface(JBinderClass)
    ['{A777626C-E877-406C-9A98-9FEB6727AB2E}']
    {class} function _GetTRANSACTION_activate: Integer; cdecl;
    {class} function _GetTRANSACTION_authenticateBlockWithKeyA: Integer; cdecl;
    {class} function _GetTRANSACTION_authenticateBlockWithKeyB: Integer; cdecl;
    {class} function _GetTRANSACTION_authenticateSectorWithKeyA: Integer; cdecl;
    {class} function _GetTRANSACTION_authenticateSectorWithKeyB: Integer; cdecl;
    {class} function _GetTRANSACTION_close: Integer; cdecl;
    {class} function _GetTRANSACTION_decrement: Integer; cdecl;
    {class} function _GetTRANSACTION_exchangeAPDU: Integer; cdecl;
    {class} function _GetTRANSACTION_getCardSerialNo: Integer; cdecl;
    {class} function _GetTRANSACTION_halt: Integer; cdecl;
    {class} function _GetTRANSACTION_increment: Integer; cdecl;
    {class} function _GetTRANSACTION_isExist: Integer; cdecl;
    {class} function _GetTRANSACTION_readBlock: Integer; cdecl;
    {class} function _GetTRANSACTION_restore: Integer; cdecl;
    {class} function _GetTRANSACTION_searchCard: Integer; cdecl;
    {class} function _GetTRANSACTION_searchCardAndActivate: Integer; cdecl;
    {class} function _GetTRANSACTION_transfer: Integer; cdecl;
    {class} function _GetTRANSACTION_writeBlock: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIMifareService; cdecl;
    {class} function getDefaultImpl: JIMifareService; cdecl;
    {class} function init: JIMifareService_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iMifareService: JIMifareService): Boolean; cdecl;
    {class} property TRANSACTION_activate: Integer read _GetTRANSACTION_activate;
    {class} property TRANSACTION_authenticateBlockWithKeyA: Integer read _GetTRANSACTION_authenticateBlockWithKeyA;
    {class} property TRANSACTION_authenticateBlockWithKeyB: Integer read _GetTRANSACTION_authenticateBlockWithKeyB;
    {class} property TRANSACTION_authenticateSectorWithKeyA: Integer read _GetTRANSACTION_authenticateSectorWithKeyA;
    {class} property TRANSACTION_authenticateSectorWithKeyB: Integer read _GetTRANSACTION_authenticateSectorWithKeyB;
    {class} property TRANSACTION_close: Integer read _GetTRANSACTION_close;
    {class} property TRANSACTION_decrement: Integer read _GetTRANSACTION_decrement;
    {class} property TRANSACTION_exchangeAPDU: Integer read _GetTRANSACTION_exchangeAPDU;
    {class} property TRANSACTION_getCardSerialNo: Integer read _GetTRANSACTION_getCardSerialNo;
    {class} property TRANSACTION_halt: Integer read _GetTRANSACTION_halt;
    {class} property TRANSACTION_increment: Integer read _GetTRANSACTION_increment;
    {class} property TRANSACTION_isExist: Integer read _GetTRANSACTION_isExist;
    {class} property TRANSACTION_readBlock: Integer read _GetTRANSACTION_readBlock;
    {class} property TRANSACTION_restore: Integer read _GetTRANSACTION_restore;
    {class} property TRANSACTION_searchCard: Integer read _GetTRANSACTION_searchCard;
    {class} property TRANSACTION_searchCardAndActivate: Integer read _GetTRANSACTION_searchCardAndActivate;
    {class} property TRANSACTION_transfer: Integer read _GetTRANSACTION_transfer;
    {class} property TRANSACTION_writeBlock: Integer read _GetTRANSACTION_writeBlock;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareService$Stub')]
  JIMifareService_Stub = interface(JBinder)
    ['{89EF6ECE-6762-4CE9-9DC4-A5EA892EF353}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIMifareService_Stub = class(TJavaGenericImport<JIMifareService_StubClass, JIMifareService_Stub>) end;

  JIMifareService_Stub_ProxyClass = interface(JIMifareServiceClass)
    ['{4113E654-6D44-40EC-8062-0A14EFC8138A}']
    {class} function _GetsDefaultImpl: JIMifareService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIMifareService); cdecl;
    {class} function activate(i: Integer): Integer; cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function authenticateBlockWithKeyA(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    {class} function decrement(i: Integer; i1: Integer): Integer; cdecl;
    {class} function init(iBinder: JIBinder): JIMifareService_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIMifareService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/IMifareService$Stub$Proxy')]
  JIMifareService_Stub_Proxy = interface(JIMifareService)
    ['{BABE9573-CCAC-4C98-9C70-87F4AA9E0EF9}']
    function authenticateBlockWithKeyB(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function authenticateSectorWithKeyA(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    function authenticateSectorWithKeyB(i: Integer; b: TJavaArray<Byte>): Integer; cdecl;
    procedure close; cdecl;
    function exchangeAPDU(b: TJavaArray<Byte>): JAPDUResponse; cdecl;
    function getCardSerialNo(i: Integer): JString; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure halt; cdecl;
    function increment(i: Integer; i1: Integer): Integer; cdecl;
    function isExist: Boolean; cdecl;
    function readBlock(i: Integer): JString; cdecl;
    function restore(i: Integer): Integer; cdecl;
    procedure searchCard(iMifareCallback: JIMifareCallback); cdecl;
    procedure searchCardAndActivate(iMifareActivateCallback: JIMifareActivateCallback); cdecl;
    function transfer(i: Integer): Integer; cdecl;
    function writeBlock(i: Integer; string_: JString): Integer; cdecl;
  end;
  TJIMifareService_Stub_Proxy = class(TJavaGenericImport<JIMifareService_Stub_ProxyClass, JIMifareService_Stub_Proxy>) end;

  JMifareStatusClass = interface(JObjectClass)
    ['{4966874D-C911-4DCD-A3A7-666C7C2F4C47}']
    {class} function _GetCARDNOACT: Integer; cdecl;
    {class} function _GetERRPARAM: Integer; cdecl;
    {class} function _GetHALT: Integer; cdecl;
    {class} function _GetIC_SWDIFF: Integer; cdecl;
    {class} function _GetINVALID_CALL: Integer; cdecl;
    {class} function _GetMULTIERR: Integer; cdecl;
    {class} function _GetNOTAGERR: Integer; cdecl;
    {class} function _GetNOT_ACTIVATE: Integer; cdecl;
    {class} function _GetPROTERR: Integer; cdecl;
    {class} function _GetREQUEST_EXCEPTION: Integer; cdecl;
    {class} function _GetSERVICE_CRASH: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} function _GetTIMEOUT: Integer; cdecl;
    {class} function _GetTRANSERR: Integer; cdecl;
    {class} property CARDNOACT: Integer read _GetCARDNOACT;
    {class} property ERRPARAM: Integer read _GetERRPARAM;
    {class} property HALT: Integer read _GetHALT;
    {class} property IC_SWDIFF: Integer read _GetIC_SWDIFF;
    {class} property INVALID_CALL: Integer read _GetINVALID_CALL;
    {class} property MULTIERR: Integer read _GetMULTIERR;
    {class} property NOTAGERR: Integer read _GetNOTAGERR;
    {class} property NOT_ACTIVATE: Integer read _GetNOT_ACTIVATE;
    {class} property PROTERR: Integer read _GetPROTERR;
    {class} property REQUEST_EXCEPTION: Integer read _GetREQUEST_EXCEPTION;
    {class} property SERVICE_CRASH: Integer read _GetSERVICE_CRASH;
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property TIMEOUT: Integer read _GetTIMEOUT;
    {class} property TRANSERR: Integer read _GetTRANSERR;
  end;

  [JavaSignature('com/getnet/posdigital/mifare/MifareStatus')]
  JMifareStatus = interface(JObject)
    ['{7B9305FF-A7E3-4255-8BBC-FDC50430DC78}']
  end;
  TJMifareStatus = class(TJavaGenericImport<JMifareStatusClass, JMifareStatus>) end;

  JAlignModeClass = interface(JObjectClass)
    ['{6FB12F66-CC84-4527-9AA3-1A29CCCB34A5}']
    {class} function _GetCENTER: Integer; cdecl;
    {class} function _GetLEFT: Integer; cdecl;
    {class} function _GetRIGHT: Integer; cdecl;
    {class} property CENTER: Integer read _GetCENTER;
    {class} property LEFT: Integer read _GetLEFT;
    {class} property RIGHT: Integer read _GetRIGHT;
  end;

  [JavaSignature('com/getnet/posdigital/printer/AlignMode')]
  JAlignMode = interface(JObject)
    ['{9C589935-26F7-4E13-B087-F1EF4512DE4F}']
  end;
  TJAlignMode = class(TJavaGenericImport<JAlignModeClass, JAlignMode>) end;

  JFontFormatClass = interface(JObjectClass)
    ['{9F779F4C-7A45-45B3-A844-7E29DE1DB352}']
    {class} function _GetLARGE: Integer; cdecl;
    {class} function _GetMEDIUM: Integer; cdecl;
    {class} function _GetSMALL: Integer; cdecl;
    {class} property LARGE: Integer read _GetLARGE;
    {class} property MEDIUM: Integer read _GetMEDIUM;
    {class} property SMALL: Integer read _GetSMALL;
  end;

  [JavaSignature('com/getnet/posdigital/printer/FontFormat')]
  JFontFormat = interface(JObject)
    ['{A5C2192D-3B8D-4359-A4B4-E377C31029CF}']
  end;
  TJFontFormat = class(TJavaGenericImport<JFontFormatClass, JFontFormat>) end;

  JIPrinterCallbackClass = interface(JIInterfaceClass)
    ['{93F2A1A8-AFFA-4325-A689-E4001D4235DF}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onError(i: Integer); cdecl;
    {class} procedure onSuccess; cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterCallback')]
  JIPrinterCallback = interface(JIInterface)
    ['{6F3DD4AD-CAF1-4EF1-9AB5-6BF611CF1AA9}']
  end;
  TJIPrinterCallback = class(TJavaGenericImport<JIPrinterCallbackClass, JIPrinterCallback>) end;

  JIPrinterCallback_DefaultClass = interface(JIPrinterCallbackClass)
    ['{98300008-292C-462B-8198-C525F9C7E154}']
    {class} function init: JIPrinterCallback_Default; cdecl;
    {class} procedure onSuccess; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterCallback$Default')]
  JIPrinterCallback_Default = interface(JIPrinterCallback)
    ['{DBD8C687-195C-4A72-918C-1D5A6D5693E8}']
    function asBinder: JIBinder; cdecl;
    procedure onError(i: Integer); cdecl;
  end;
  TJIPrinterCallback_Default = class(TJavaGenericImport<JIPrinterCallback_DefaultClass, JIPrinterCallback_Default>) end;

  JIPrinterCallback_StubClass = interface(JBinderClass)
    ['{64F6497A-2916-4FDE-9482-FA738C8C78BD}']
    {class} function _GetTRANSACTION_onError: Integer; cdecl;
    {class} function _GetTRANSACTION_onSuccess: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIPrinterCallback; cdecl;
    {class} function getDefaultImpl: JIPrinterCallback; cdecl;
    {class} function init: JIPrinterCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iPrinterCallback: JIPrinterCallback): Boolean; cdecl;
    {class} property TRANSACTION_onError: Integer read _GetTRANSACTION_onError;
    {class} property TRANSACTION_onSuccess: Integer read _GetTRANSACTION_onSuccess;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterCallback$Stub')]
  JIPrinterCallback_Stub = interface(JBinder)
    ['{D55B2A5A-07DD-4116-A01A-27CC525E4648}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIPrinterCallback_Stub = class(TJavaGenericImport<JIPrinterCallback_StubClass, JIPrinterCallback_Stub>) end;

  JIPrinterCallback_Stub_ProxyClass = interface(JIPrinterCallbackClass)
    ['{67F0DCA4-F7BC-4B82-A908-96ED7F5B3432}']
    {class} function _GetsDefaultImpl: JIPrinterCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIPrinterCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIPrinterCallback_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIPrinterCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterCallback$Stub$Proxy')]
  JIPrinterCallback_Stub_Proxy = interface(JIPrinterCallback)
    ['{85C7D428-2C8D-410B-875A-69729A44E5B4}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onError(i: Integer); cdecl;
    procedure onSuccess; cdecl;
  end;
  TJIPrinterCallback_Stub_Proxy = class(TJavaGenericImport<JIPrinterCallback_Stub_ProxyClass, JIPrinterCallback_Stub_Proxy>) end;

  JIPrinterServiceClass = interface(JIInterfaceClass)
    ['{6826FA4F-B275-411A-8C07-0BAC503563F3}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure addImageBitmap(i: Integer; bitmap: JBitmap); cdecl;
    {class} function getStatus: Integer; cdecl;
    {class} procedure print(iPrinterCallback: JIPrinterCallback); cdecl;
    {class} procedure setGray(i: Integer); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterService')]
  JIPrinterService = interface(JIInterface)
    ['{529393E9-B73A-4412-B36F-58C0FCF0B5FE}']
    procedure addBarCode(i: Integer; string_: JString); cdecl;
    procedure addImageByteArray(i: Integer; b: TJavaArray<Byte>); cdecl;
    procedure addQrCode(i: Integer; i1: Integer; string_: JString); cdecl;
    procedure addText(i: Integer; string_: JString); cdecl;
    procedure defineFontFormat(i: Integer); cdecl;
    procedure init; cdecl;
    procedure printAndRemovePaper(iPrinterCallback: JIPrinterCallback); cdecl;
  end;
  TJIPrinterService = class(TJavaGenericImport<JIPrinterServiceClass, JIPrinterService>) end;

  JIPrinterService_DefaultClass = interface(JIPrinterServiceClass)
    ['{53C223E9-05EC-416A-AF6B-E0652AD27119}']
    {class} procedure addQrCode(i: Integer; i1: Integer; string_: JString); cdecl;
    {class} function getStatus: Integer; cdecl;
    {class} function init: JIPrinterService_Default; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterService$Default')]
  JIPrinterService_Default = interface(JIPrinterService)
    ['{AB94708A-F22A-4D03-B019-4E2DDFF71937}']
    procedure addBarCode(i: Integer; string_: JString); cdecl;
    procedure addImageBitmap(i: Integer; bitmap: JBitmap); cdecl;
    procedure addImageByteArray(i: Integer; b: TJavaArray<Byte>); cdecl;
    procedure addText(i: Integer; string_: JString); cdecl;
    function asBinder: JIBinder; cdecl;
    procedure defineFontFormat(i: Integer); cdecl;
    procedure print(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printAndRemovePaper(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setGray(i: Integer); cdecl;
  end;
  TJIPrinterService_Default = class(TJavaGenericImport<JIPrinterService_DefaultClass, JIPrinterService_Default>) end;

  JIPrinterService_StubClass = interface(JBinderClass)
    ['{9D8EF266-24C4-4793-84E5-FEEC20E07A40}']
    {class} function _GetTRANSACTION_addImageBitmap: Integer; cdecl;
    {class} function _GetTRANSACTION_getStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_print: Integer; cdecl;
    {class} function _GetTRANSACTION_setGray: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIPrinterService; cdecl;
    {class} function getDefaultImpl: JIPrinterService; cdecl;
    {class} function init: JIPrinterService_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iPrinterService: JIPrinterService): Boolean; cdecl;
    {class} property TRANSACTION_addImageBitmap: Integer read _GetTRANSACTION_addImageBitmap;
    {class} property TRANSACTION_getStatus: Integer read _GetTRANSACTION_getStatus;
    {class} property TRANSACTION_print: Integer read _GetTRANSACTION_print;
    {class} property TRANSACTION_setGray: Integer read _GetTRANSACTION_setGray;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterService$Stub')]
  JIPrinterService_Stub = interface(JBinder)
    ['{708FDC71-F277-4581-9FB7-67F8BF7F4D06}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIPrinterService_Stub = class(TJavaGenericImport<JIPrinterService_StubClass, JIPrinterService_Stub>) end;

  JIPrinterService_Stub_ProxyClass = interface(JIPrinterServiceClass)
    ['{17407362-4495-4709-9539-CD228592ED82}']
    {class} function _GetsDefaultImpl: JIPrinterService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIPrinterService); cdecl;
    {class} procedure addImageByteArray(i: Integer; b: TJavaArray<Byte>); cdecl;
    {class} procedure addText(i: Integer; string_: JString); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIPrinterService_Stub_Proxy; cdecl; overload;
    {class} procedure printAndRemovePaper(iPrinterCallback: JIPrinterCallback); cdecl;
    {class} property sDefaultImpl: JIPrinterService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/printer/IPrinterService$Stub$Proxy')]
  JIPrinterService_Stub_Proxy = interface(JIPrinterService)
    ['{15524A9D-23E0-45AE-BFCC-5B384BEF86A1}']
    procedure addBarCode(i: Integer; string_: JString); cdecl;
    procedure addImageBitmap(i: Integer; bitmap: JBitmap); cdecl;
    procedure addQrCode(i: Integer; i1: Integer; string_: JString); cdecl;
    procedure defineFontFormat(i: Integer); cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getStatus: Integer; cdecl;
    procedure init; cdecl; overload;
    procedure print(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setGray(i: Integer); cdecl;
  end;
  TJIPrinterService_Stub_Proxy = class(TJavaGenericImport<JIPrinterService_Stub_ProxyClass, JIPrinterService_Stub_Proxy>) end;

  JPrinterStatusClass = interface(JObjectClass)
    ['{1C0B5454-4BBE-42F4-AAF5-908AD04BAD20}']
    {class} function _GetERROR_BUFOVERFLOW: Integer; cdecl;
    {class} function _GetERROR_LIFTHEAD: Integer; cdecl;
    {class} function _GetERROR_LOWTEMP: Integer; cdecl;
    {class} function _GetERROR_LOWVOL: Integer; cdecl;
    {class} function _GetERROR_MOTORERR: Integer; cdecl;
    {class} function _GetERROR_NOT_INIT: Integer; cdecl;
    {class} function _GetERROR_NO_PAPER: Integer; cdecl;
    {class} function _GetERROR_OVERHEAT: Integer; cdecl;
    {class} function _GetERROR_PAPERENDING: Integer; cdecl;
    {class} function _GetERROR_PAPERJAM: Integer; cdecl;
    {class} function _GetERROR_PARAM: Integer; cdecl;
    {class} function _GetOK: Integer; cdecl;
    {class} function _GetPRINTING: Integer; cdecl;
    {class} function _GetUNKNOW: Integer; cdecl;
    {class} property ERROR_BUFOVERFLOW: Integer read _GetERROR_BUFOVERFLOW;
    {class} property ERROR_LIFTHEAD: Integer read _GetERROR_LIFTHEAD;
    {class} property ERROR_LOWTEMP: Integer read _GetERROR_LOWTEMP;
    {class} property ERROR_LOWVOL: Integer read _GetERROR_LOWVOL;
    {class} property ERROR_MOTORERR: Integer read _GetERROR_MOTORERR;
    {class} property ERROR_NOT_INIT: Integer read _GetERROR_NOT_INIT;
    {class} property ERROR_NO_PAPER: Integer read _GetERROR_NO_PAPER;
    {class} property ERROR_OVERHEAT: Integer read _GetERROR_OVERHEAT;
    {class} property ERROR_PAPERENDING: Integer read _GetERROR_PAPERENDING;
    {class} property ERROR_PAPERJAM: Integer read _GetERROR_PAPERJAM;
    {class} property ERROR_PARAM: Integer read _GetERROR_PARAM;
    {class} property OK: Integer read _GetOK;
    {class} property PRINTING: Integer read _GetPRINTING;
    {class} property UNKNOW: Integer read _GetUNKNOW;
  end;

  [JavaSignature('com/getnet/posdigital/printer/PrinterStatus')]
  JPrinterStatus = interface(JObject)
    ['{E5EDE6EA-5A65-44F4-9EFA-D7D54A45EF35}']
  end;
  TJPrinterStatus = class(TJavaGenericImport<JPrinterStatusClass, JPrinterStatus>) end;

  JIStatCallbackClass = interface(JIInterfaceClass)
    ['{DAC9F73F-2A14-48F2-8213-97C34C589E75}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure onError(string_: JString); cdecl;
    {class} procedure onStatistic(statResponse: JStatResponse); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatCallback')]
  JIStatCallback = interface(JIInterface)
    ['{BCE3C5BA-A4DF-4340-8E90-5E679610BD32}']
  end;
  TJIStatCallback = class(TJavaGenericImport<JIStatCallbackClass, JIStatCallback>) end;

  JIStatCallback_DefaultClass = interface(JIStatCallbackClass)
    ['{587F767C-68F7-4AAB-9928-D512C512B3E7}']
    {class} function init: JIStatCallback_Default; cdecl;
    {class} procedure onStatistic(statResponse: JStatResponse); cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatCallback$Default')]
  JIStatCallback_Default = interface(JIStatCallback)
    ['{EA810268-1516-46F1-91F2-1323519F2B4B}']
    function asBinder: JIBinder; cdecl;
    procedure onError(string_: JString); cdecl;
  end;
  TJIStatCallback_Default = class(TJavaGenericImport<JIStatCallback_DefaultClass, JIStatCallback_Default>) end;

  JIStatCallback_StubClass = interface(JBinderClass)
    ['{27DC9706-992E-46C4-B56D-CCC4BB0328B2}']
    {class} function _GetTRANSACTION_onError: Integer; cdecl;
    {class} function _GetTRANSACTION_onStatistic: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIStatCallback; cdecl;
    {class} function getDefaultImpl: JIStatCallback; cdecl;
    {class} function init: JIStatCallback_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iStatCallback: JIStatCallback): Boolean; cdecl;
    {class} property TRANSACTION_onError: Integer read _GetTRANSACTION_onError;
    {class} property TRANSACTION_onStatistic: Integer read _GetTRANSACTION_onStatistic;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatCallback$Stub')]
  JIStatCallback_Stub = interface(JBinder)
    ['{BA22E424-20E4-413A-9665-18344F937629}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIStatCallback_Stub = class(TJavaGenericImport<JIStatCallback_StubClass, JIStatCallback_Stub>) end;

  JIStatCallback_Stub_ProxyClass = interface(JIStatCallbackClass)
    ['{B54844CE-9F88-4A69-9AFC-97CB00EB9D6F}']
    {class} function _GetsDefaultImpl: JIStatCallback; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIStatCallback); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function init(iBinder: JIBinder): JIStatCallback_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIStatCallback read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatCallback$Stub$Proxy')]
  JIStatCallback_Stub_Proxy = interface(JIStatCallback)
    ['{9F00AD22-D538-44C7-9137-8F754A8D5374}']
    function getInterfaceDescriptor: JString; cdecl;
    procedure onError(string_: JString); cdecl;
    procedure onStatistic(statResponse: JStatResponse); cdecl;
  end;
  TJIStatCallback_Stub_Proxy = class(TJavaGenericImport<JIStatCallback_Stub_ProxyClass, JIStatCallback_Stub_Proxy>) end;

  JIStatServiceClass = interface(JIInterfaceClass)
    ['{F393CCDB-6DDA-40B8-8BE9-AB572BF4271F}']
    {class} function _GetDESCRIPTOR: JString; cdecl;
    {class} procedure getAllAppChipStatusFail(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getAllAppMagStatusFail(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getAllAppNfcStatusFail(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getAllAppPaperStatus(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getPaperStatus(iStatCallback: JIStatCallback); cdecl;
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatService')]
  JIStatService = interface(JIInterface)
    ['{9D730840-16E8-45A6-8D05-A003A4199791}']
    procedure getAllAppChipStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppMagStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppNfcStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllStatisticsByApp(iStatCallback: JIStatCallback); cdecl;
    procedure getAllStatisticsDifferenceByApp(iStatCallback: JIStatCallback); cdecl;
    procedure getChipStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getChipStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getMagStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getMagStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getMifareStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getMifareStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getNfcStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getNfcStatusFail(iStatCallback: JIStatCallback); cdecl;
  end;
  TJIStatService = class(TJavaGenericImport<JIStatServiceClass, JIStatService>) end;

  JIStatService_DefaultClass = interface(JIStatServiceClass)
    ['{655A9258-AB8D-4E9F-BD49-2B35B5529BC3}']
    {class} procedure getChipStatusFail(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getMagStatusFail(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getNfcStatusFail(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getPaperStatus(iStatCallback: JIStatCallback); cdecl;
    {class} function init: JIStatService_Default; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatService$Default')]
  JIStatService_Default = interface(JIStatService)
    ['{B6694033-116F-4100-B4C1-31D68420C328}']
    function asBinder: JIBinder; cdecl;
    procedure getAllAppChipStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppChipStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppMagStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppMagStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppNfcStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppNfcStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppPaperStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllStatisticsByApp(iStatCallback: JIStatCallback); cdecl;
    procedure getAllStatisticsDifferenceByApp(iStatCallback: JIStatCallback); cdecl;
    procedure getChipStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getMagStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getMifareStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getMifareStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getNfcStatus(iStatCallback: JIStatCallback); cdecl;
  end;
  TJIStatService_Default = class(TJavaGenericImport<JIStatService_DefaultClass, JIStatService_Default>) end;

  JIStatService_StubClass = interface(JBinderClass)
    ['{805B39BF-1880-4E25-AB8C-6C859EDA553B}']
    {class} function _GetTRANSACTION_getAllAppChipStatusFail: Integer; cdecl;
    {class} function _GetTRANSACTION_getAllAppMagStatusFail: Integer; cdecl;
    {class} function _GetTRANSACTION_getAllAppNfcStatusFail: Integer; cdecl;
    {class} function _GetTRANSACTION_getAllAppPaperStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_getPaperStatus: Integer; cdecl;
    {class} function asInterface(iBinder: JIBinder): JIStatService; cdecl;
    {class} function getDefaultImpl: JIStatService; cdecl;
    {class} function init: JIStatService_Stub; cdecl;//Deprecated
    {class} function setDefaultImpl(iStatService: JIStatService): Boolean; cdecl;
    {class} property TRANSACTION_getAllAppChipStatusFail: Integer read _GetTRANSACTION_getAllAppChipStatusFail;
    {class} property TRANSACTION_getAllAppMagStatusFail: Integer read _GetTRANSACTION_getAllAppMagStatusFail;
    {class} property TRANSACTION_getAllAppNfcStatusFail: Integer read _GetTRANSACTION_getAllAppNfcStatusFail;
    {class} property TRANSACTION_getAllAppPaperStatus: Integer read _GetTRANSACTION_getAllAppPaperStatus;
    {class} property TRANSACTION_getPaperStatus: Integer read _GetTRANSACTION_getPaperStatus;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatService$Stub')]
  JIStatService_Stub = interface(JBinder)
    ['{23F23E7E-0103-4275-8FC2-7BE33112A792}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;
  TJIStatService_Stub = class(TJavaGenericImport<JIStatService_StubClass, JIStatService_Stub>) end;

  JIStatService_Stub_ProxyClass = interface(JIStatServiceClass)
    ['{01CEC5A9-71F9-4579-8AE8-FA154EA6FC70}']
    {class} function _GetsDefaultImpl: JIStatService; cdecl;
    {class} procedure _SetsDefaultImpl(Value: JIStatService); cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} procedure getChipStatus(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getMagStatus(iStatCallback: JIStatCallback); cdecl;
    {class} procedure getNfcStatus(iStatCallback: JIStatCallback); cdecl;
    {class} function init(iBinder: JIBinder): JIStatService_Stub_Proxy; cdecl;
    {class} property sDefaultImpl: JIStatService read _GetsDefaultImpl write _SetsDefaultImpl;
  end;

  [JavaSignature('com/getnet/posdigital/stat/IStatService$Stub$Proxy')]
  JIStatService_Stub_Proxy = interface(JIStatService)
    ['{4F0CD762-3F7E-4D17-A8A7-EEA68B6B5DB2}']
    procedure getAllAppChipStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppChipStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppMagStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppMagStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppNfcStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppNfcStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getAllAppPaperStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getAllStatisticsByApp(iStatCallback: JIStatCallback); cdecl;
    procedure getAllStatisticsDifferenceByApp(iStatCallback: JIStatCallback); cdecl;
    procedure getChipStatusFail(iStatCallback: JIStatCallback); cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure getMagStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getMifareStatus(iStatCallback: JIStatCallback); cdecl;
    procedure getMifareStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getNfcStatusFail(iStatCallback: JIStatCallback); cdecl;
    procedure getPaperStatus(iStatCallback: JIStatCallback); cdecl;
  end;
  TJIStatService_Stub_Proxy = class(TJavaGenericImport<JIStatService_Stub_ProxyClass, JIStatService_Stub_Proxy>) end;

  JStatResponseClass = interface(JParcelableClass)
    ['{50BF6F81-0A0E-4D97-9E17-E370F145AD25}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JStatResponse; cdecl; overload;
    {class} function init(parcel: JParcel): JStatResponse; cdecl; overload;
    {class} procedure setGeneralMagStatus(string_: JString); cdecl;
    {class} procedure setGeneralMagStatusFail(string_: JString); cdecl;
    {class} procedure setGeneralNfcStatusFail(string_: JString); cdecl;
    {class} procedure setGeneralPaperStatus(string_: JString); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/getnet/posdigital/stat/StatResponse')]
  JStatResponse = interface(JParcelable)
    ['{A65C83C5-AECF-46D3-9647-0BCB1A78DD11}']
    function describeContents: Integer; cdecl;
    function getAppChipStatus: JString; cdecl;
    function getAppChipStatusFail: JString; cdecl;
    function getAppMagStatus: JString; cdecl;
    function getAppMagStatusFail: JString; cdecl;
    function getAppMifareStatus: JString; cdecl;
    function getAppMifareStatusFail: JString; cdecl;
    function getAppNfcStatus: JString; cdecl;
    function getAppNfcStatusFail: JString; cdecl;
    function getAppPaperStatus: JString; cdecl;
    function getGeneralChipStatus: JString; cdecl;
    function getGeneralChipStatusFail: JString; cdecl;
    function getGeneralMagStatus: JString; cdecl;
    function getGeneralMagStatusFail: JString; cdecl;
    function getGeneralMifareStatus: JString; cdecl;
    function getGeneralMifareStatusFail: JString; cdecl;
    function getGeneralNfcStatus: JString; cdecl;
    function getGeneralNfcStatusFail: JString; cdecl;
    function getGeneralPaperStatus: JString; cdecl;
    procedure setAppChipStatus(string_: JString); cdecl;
    procedure setAppChipStatusFail(string_: JString); cdecl;
    procedure setAppMagStatus(string_: JString); cdecl;
    procedure setAppMagStatusFail(string_: JString); cdecl;
    procedure setAppMifareStatus(string_: JString); cdecl;
    procedure setAppMifareStatusFail(string_: JString); cdecl;
    procedure setAppNfcStatus(string_: JString); cdecl;
    procedure setAppNfcStatusFail(string_: JString); cdecl;
    procedure setAppPaperStatus(string_: JString); cdecl;
    procedure setGeneralChipStatus(string_: JString); cdecl;
    procedure setGeneralChipStatusFail(string_: JString); cdecl;
    procedure setGeneralMifareStatus(string_: JString); cdecl;
    procedure setGeneralMifareStatusFail(string_: JString); cdecl;
    procedure setGeneralNfcStatus(string_: JString); cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;
  TJStatResponse = class(TJavaGenericImport<JStatResponseClass, JStatResponse>) end;

  JStatResponse_1Class = interface(JParcelable_CreatorClass)
    ['{1F7B671C-51C7-4D5F-BE7F-CF5185C42A3B}']
    {class} function createFromParcel(parcel: JParcel): JStatResponse; cdecl;
    {class} function init: JStatResponse_1; cdecl;
  end;

  [JavaSignature('com/getnet/posdigital/stat/StatResponse$1')]
  JStatResponse_1 = interface(JParcelable_Creator)
    ['{C1A123E7-8012-4042-9C7B-2D1845312DF9}']
    function newArray(i: Integer): TJavaObjectArray<JStatResponse>; cdecl;
  end;
  TJStatResponse_1 = class(TJavaGenericImport<JStatResponse_1Class, JStatResponse_1>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JAnimator', TypeInfo(android.jni.posdigitalgetnet.JAnimator));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JAnimator_AnimatorListener', TypeInfo(android.jni.posdigitalgetnet.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JAnimator_AnimatorPauseListener', TypeInfo(android.jni.posdigitalgetnet.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JKeyframe', TypeInfo(android.jni.posdigitalgetnet.JKeyframe));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JLayoutTransition', TypeInfo(android.jni.posdigitalgetnet.JLayoutTransition));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JLayoutTransition_TransitionListener', TypeInfo(android.jni.posdigitalgetnet.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPropertyValuesHolder', TypeInfo(android.jni.posdigitalgetnet.JPropertyValuesHolder));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JStateListAnimator', TypeInfo(android.jni.posdigitalgetnet.JStateListAnimator));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JTimeInterpolator', TypeInfo(android.jni.posdigitalgetnet.JTimeInterpolator));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JTypeConverter', TypeInfo(android.jni.posdigitalgetnet.JTypeConverter));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JTypeEvaluator', TypeInfo(android.jni.posdigitalgetnet.JTypeEvaluator));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JValueAnimator', TypeInfo(android.jni.posdigitalgetnet.JValueAnimator));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JValueAnimator_AnimatorUpdateListener', TypeInfo(android.jni.posdigitalgetnet.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JInterpolator', TypeInfo(android.jni.posdigitalgetnet.JInterpolator));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.Jposdigital_BuildConfig', TypeInfo(android.jni.posdigitalgetnet.Jposdigital_BuildConfig));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMainService', TypeInfo(android.jni.posdigitalgetnet.JIMainService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMainService_Default', TypeInfo(android.jni.posdigitalgetnet.JIMainService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMainService_Stub', TypeInfo(android.jni.posdigitalgetnet.JIMainService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMainService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIMainService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPosDigital', TypeInfo(android.jni.posdigitalgetnet.JPosDigital));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPosDigital_1', TypeInfo(android.jni.posdigitalgetnet.JPosDigital_1));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPosDigital_2', TypeInfo(android.jni.posdigitalgetnet.JPosDigital_2));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPosDigital_3', TypeInfo(android.jni.posdigitalgetnet.JPosDigital_3));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPosDigital_BindCallback', TypeInfo(android.jni.posdigitalgetnet.JPosDigital_BindCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPosDigitalRuntimeException', TypeInfo(android.jni.posdigitalgetnet.JPosDigitalRuntimeException));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIBeeperService', TypeInfo(android.jni.posdigitalgetnet.JIBeeperService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIBeeperService_Default', TypeInfo(android.jni.posdigitalgetnet.JIBeeperService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIBeeperService_Stub', TypeInfo(android.jni.posdigitalgetnet.JIBeeperService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIBeeperService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIBeeperService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraCallback', TypeInfo(android.jni.posdigitalgetnet.JICameraCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JICameraCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JICameraCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JICameraCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraService', TypeInfo(android.jni.posdigitalgetnet.JICameraService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraService_Default', TypeInfo(android.jni.posdigitalgetnet.JICameraService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraService_Stub', TypeInfo(android.jni.posdigitalgetnet.JICameraService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICameraService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JICameraService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JCardResponse', TypeInfo(android.jni.posdigitalgetnet.JCardResponse));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JCardResponse_1', TypeInfo(android.jni.posdigitalgetnet.JCardResponse_1));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardCallback', TypeInfo(android.jni.posdigitalgetnet.JICardCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JICardCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JICardCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JICardCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardService', TypeInfo(android.jni.posdigitalgetnet.JICardService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardService_Default', TypeInfo(android.jni.posdigitalgetnet.JICardService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardService_Stub', TypeInfo(android.jni.posdigitalgetnet.JICardService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JICardService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JICardService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JSearchType', TypeInfo(android.jni.posdigitalgetnet.JSearchType));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JBitmapUtils', TypeInfo(android.jni.posdigitalgetnet.JBitmapUtils));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.Jextension_ViewUtils', TypeInfo(android.jni.posdigitalgetnet.Jextension_ViewUtils));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoCallback', TypeInfo(android.jni.posdigitalgetnet.JIInfoCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JIInfoCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JIInfoCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIInfoCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoService', TypeInfo(android.jni.posdigitalgetnet.JIInfoService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoService_Default', TypeInfo(android.jni.posdigitalgetnet.JIInfoService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoService_Stub', TypeInfo(android.jni.posdigitalgetnet.JIInfoService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIInfoService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIInfoService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JInfoResponse', TypeInfo(android.jni.posdigitalgetnet.JInfoResponse));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JInfoResponse_1', TypeInfo(android.jni.posdigitalgetnet.JInfoResponse_1));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JILedService', TypeInfo(android.jni.posdigitalgetnet.JILedService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JILedService_Default', TypeInfo(android.jni.posdigitalgetnet.JILedService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JILedService_Stub', TypeInfo(android.jni.posdigitalgetnet.JILedService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JILedService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JILedService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JAPDUResponse', TypeInfo(android.jni.posdigitalgetnet.JAPDUResponse));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JAPDUResponse_1', TypeInfo(android.jni.posdigitalgetnet.JAPDUResponse_1));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareActivateCallback', TypeInfo(android.jni.posdigitalgetnet.JIMifareActivateCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareActivateCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JIMifareActivateCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareActivateCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JIMifareActivateCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareActivateCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIMifareActivateCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareCallback', TypeInfo(android.jni.posdigitalgetnet.JIMifareCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JIMifareCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JIMifareCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIMifareCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareService', TypeInfo(android.jni.posdigitalgetnet.JIMifareService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareService_Default', TypeInfo(android.jni.posdigitalgetnet.JIMifareService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareService_Stub', TypeInfo(android.jni.posdigitalgetnet.JIMifareService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIMifareService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIMifareService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JMifareStatus', TypeInfo(android.jni.posdigitalgetnet.JMifareStatus));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JAlignMode', TypeInfo(android.jni.posdigitalgetnet.JAlignMode));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JFontFormat', TypeInfo(android.jni.posdigitalgetnet.JFontFormat));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterCallback', TypeInfo(android.jni.posdigitalgetnet.JIPrinterCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JIPrinterCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JIPrinterCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIPrinterCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterService', TypeInfo(android.jni.posdigitalgetnet.JIPrinterService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterService_Default', TypeInfo(android.jni.posdigitalgetnet.JIPrinterService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterService_Stub', TypeInfo(android.jni.posdigitalgetnet.JIPrinterService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIPrinterService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIPrinterService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JPrinterStatus', TypeInfo(android.jni.posdigitalgetnet.JPrinterStatus));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatCallback', TypeInfo(android.jni.posdigitalgetnet.JIStatCallback));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatCallback_Default', TypeInfo(android.jni.posdigitalgetnet.JIStatCallback_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatCallback_Stub', TypeInfo(android.jni.posdigitalgetnet.JIStatCallback_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatCallback_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIStatCallback_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatService', TypeInfo(android.jni.posdigitalgetnet.JIStatService));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatService_Default', TypeInfo(android.jni.posdigitalgetnet.JIStatService_Default));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatService_Stub', TypeInfo(android.jni.posdigitalgetnet.JIStatService_Stub));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JIStatService_Stub_Proxy', TypeInfo(android.jni.posdigitalgetnet.JIStatService_Stub_Proxy));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JStatResponse', TypeInfo(android.jni.posdigitalgetnet.JStatResponse));
  TRegTypes.RegisterType('android.jni.posdigitalgetnet.JStatResponse_1', TypeInfo(android.jni.posdigitalgetnet.JStatResponse_1));
end;

initialization
  RegisterTypes;
end.

