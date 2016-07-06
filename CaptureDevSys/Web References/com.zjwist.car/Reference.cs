﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.34003
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

// 
// 此源代码是由 Microsoft.VSDesigner 4.0.30319.34003 版自动生成。
// 
#pragma warning disable 1591

namespace CaptureDevSys.com.zjwist.car {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    using System.Data;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="CarServiceSoap", Namespace="http://tempuri.org/")]
    public partial class CarService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback TestSaveCarInfoOperationCompleted;
        
        private System.Threading.SendOrPostCallback SaveCarInfoOperationCompleted;
        
        private System.Threading.SendOrPostCallback CarStatByDayOperationCompleted;
        
        private System.Threading.SendOrPostCallback CarLogByDayOperationCompleted;
        
        private System.Threading.SendOrPostCallback CarImageDeleteOperationCompleted;
        
        private System.Threading.SendOrPostCallback FiveMinuteProcOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetWithOutInfoOperationCompleted;
        
        private System.Threading.SendOrPostCallback SetDeviceErrorOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public CarService() {
            this.Url = global::CaptureDevSys.Properties.Settings.Default.CaptureDevSys_com_zjwist_car_CarService;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event TestSaveCarInfoCompletedEventHandler TestSaveCarInfoCompleted;
        
        /// <remarks/>
        public event SaveCarInfoCompletedEventHandler SaveCarInfoCompleted;
        
        /// <remarks/>
        public event CarStatByDayCompletedEventHandler CarStatByDayCompleted;
        
        /// <remarks/>
        public event CarLogByDayCompletedEventHandler CarLogByDayCompleted;
        
        /// <remarks/>
        public event CarImageDeleteCompletedEventHandler CarImageDeleteCompleted;
        
        /// <remarks/>
        public event FiveMinuteProcCompletedEventHandler FiveMinuteProcCompleted;
        
        /// <remarks/>
        public event GetWithOutInfoCompletedEventHandler GetWithOutInfoCompleted;
        
        /// <remarks/>
        public event SetDeviceErrorCompletedEventHandler SetDeviceErrorCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/TestSaveCarInfo", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string TestSaveCarInfo(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg, int Believe1, int Believe2) {
            object[] results = this.Invoke("TestSaveCarInfo", new object[] {
                        DeviceName,
                        CarNo,
                        PassTime,
                        NoColor,
                        CarType,
                        CarDirection,
                        CarImg,
                        Believe1,
                        Believe2});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void TestSaveCarInfoAsync(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg, int Believe1, int Believe2) {
            this.TestSaveCarInfoAsync(DeviceName, CarNo, PassTime, NoColor, CarType, CarDirection, CarImg, Believe1, Believe2, null);
        }
        
        /// <remarks/>
        public void TestSaveCarInfoAsync(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg, int Believe1, int Believe2, object userState) {
            if ((this.TestSaveCarInfoOperationCompleted == null)) {
                this.TestSaveCarInfoOperationCompleted = new System.Threading.SendOrPostCallback(this.OnTestSaveCarInfoOperationCompleted);
            }
            this.InvokeAsync("TestSaveCarInfo", new object[] {
                        DeviceName,
                        CarNo,
                        PassTime,
                        NoColor,
                        CarType,
                        CarDirection,
                        CarImg,
                        Believe1,
                        Believe2}, this.TestSaveCarInfoOperationCompleted, userState);
        }
        
        private void OnTestSaveCarInfoOperationCompleted(object arg) {
            if ((this.TestSaveCarInfoCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.TestSaveCarInfoCompleted(this, new TestSaveCarInfoCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SaveCarInfo", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string SaveCarInfo(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg) {
            object[] results = this.Invoke("SaveCarInfo", new object[] {
                        DeviceName,
                        CarNo,
                        PassTime,
                        NoColor,
                        CarType,
                        CarDirection,
                        CarImg});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void SaveCarInfoAsync(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg) {
            this.SaveCarInfoAsync(DeviceName, CarNo, PassTime, NoColor, CarType, CarDirection, CarImg, null);
        }
        
        /// <remarks/>
        public void SaveCarInfoAsync(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg, object userState) {
            if ((this.SaveCarInfoOperationCompleted == null)) {
                this.SaveCarInfoOperationCompleted = new System.Threading.SendOrPostCallback(this.OnSaveCarInfoOperationCompleted);
            }
            this.InvokeAsync("SaveCarInfo", new object[] {
                        DeviceName,
                        CarNo,
                        PassTime,
                        NoColor,
                        CarType,
                        CarDirection,
                        CarImg}, this.SaveCarInfoOperationCompleted, userState);
        }
        
        private void OnSaveCarInfoOperationCompleted(object arg) {
            if ((this.SaveCarInfoCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SaveCarInfoCompleted(this, new SaveCarInfoCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/CarStatByDay", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataSet CarStatByDay(int unitid, string carday) {
            object[] results = this.Invoke("CarStatByDay", new object[] {
                        unitid,
                        carday});
            return ((System.Data.DataSet)(results[0]));
        }
        
        /// <remarks/>
        public void CarStatByDayAsync(int unitid, string carday) {
            this.CarStatByDayAsync(unitid, carday, null);
        }
        
        /// <remarks/>
        public void CarStatByDayAsync(int unitid, string carday, object userState) {
            if ((this.CarStatByDayOperationCompleted == null)) {
                this.CarStatByDayOperationCompleted = new System.Threading.SendOrPostCallback(this.OnCarStatByDayOperationCompleted);
            }
            this.InvokeAsync("CarStatByDay", new object[] {
                        unitid,
                        carday}, this.CarStatByDayOperationCompleted, userState);
        }
        
        private void OnCarStatByDayOperationCompleted(object arg) {
            if ((this.CarStatByDayCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.CarStatByDayCompleted(this, new CarStatByDayCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/CarLogByDay", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataSet CarLogByDay(int unitid, string logday) {
            object[] results = this.Invoke("CarLogByDay", new object[] {
                        unitid,
                        logday});
            return ((System.Data.DataSet)(results[0]));
        }
        
        /// <remarks/>
        public void CarLogByDayAsync(int unitid, string logday) {
            this.CarLogByDayAsync(unitid, logday, null);
        }
        
        /// <remarks/>
        public void CarLogByDayAsync(int unitid, string logday, object userState) {
            if ((this.CarLogByDayOperationCompleted == null)) {
                this.CarLogByDayOperationCompleted = new System.Threading.SendOrPostCallback(this.OnCarLogByDayOperationCompleted);
            }
            this.InvokeAsync("CarLogByDay", new object[] {
                        unitid,
                        logday}, this.CarLogByDayOperationCompleted, userState);
        }
        
        private void OnCarLogByDayOperationCompleted(object arg) {
            if ((this.CarLogByDayCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.CarLogByDayCompleted(this, new CarLogByDayCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/CarImageDelete", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void CarImageDelete() {
            this.Invoke("CarImageDelete", new object[0]);
        }
        
        /// <remarks/>
        public void CarImageDeleteAsync() {
            this.CarImageDeleteAsync(null);
        }
        
        /// <remarks/>
        public void CarImageDeleteAsync(object userState) {
            if ((this.CarImageDeleteOperationCompleted == null)) {
                this.CarImageDeleteOperationCompleted = new System.Threading.SendOrPostCallback(this.OnCarImageDeleteOperationCompleted);
            }
            this.InvokeAsync("CarImageDelete", new object[0], this.CarImageDeleteOperationCompleted, userState);
        }
        
        private void OnCarImageDeleteOperationCompleted(object arg) {
            if ((this.CarImageDeleteCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.CarImageDeleteCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/FiveMinuteProc", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void FiveMinuteProc() {
            this.Invoke("FiveMinuteProc", new object[0]);
        }
        
        /// <remarks/>
        public void FiveMinuteProcAsync() {
            this.FiveMinuteProcAsync(null);
        }
        
        /// <remarks/>
        public void FiveMinuteProcAsync(object userState) {
            if ((this.FiveMinuteProcOperationCompleted == null)) {
                this.FiveMinuteProcOperationCompleted = new System.Threading.SendOrPostCallback(this.OnFiveMinuteProcOperationCompleted);
            }
            this.InvokeAsync("FiveMinuteProc", new object[0], this.FiveMinuteProcOperationCompleted, userState);
        }
        
        private void OnFiveMinuteProcOperationCompleted(object arg) {
            if ((this.FiveMinuteProcCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.FiveMinuteProcCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetWithOutInfo", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataTable GetWithOutInfo() {
            object[] results = this.Invoke("GetWithOutInfo", new object[0]);
            return ((System.Data.DataTable)(results[0]));
        }
        
        /// <remarks/>
        public void GetWithOutInfoAsync() {
            this.GetWithOutInfoAsync(null);
        }
        
        /// <remarks/>
        public void GetWithOutInfoAsync(object userState) {
            if ((this.GetWithOutInfoOperationCompleted == null)) {
                this.GetWithOutInfoOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetWithOutInfoOperationCompleted);
            }
            this.InvokeAsync("GetWithOutInfo", new object[0], this.GetWithOutInfoOperationCompleted, userState);
        }
        
        private void OnGetWithOutInfoOperationCompleted(object arg) {
            if ((this.GetWithOutInfoCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetWithOutInfoCompleted(this, new GetWithOutInfoCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SetDeviceError", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void SetDeviceError(string DeviceName) {
            this.Invoke("SetDeviceError", new object[] {
                        DeviceName});
        }
        
        /// <remarks/>
        public void SetDeviceErrorAsync(string DeviceName) {
            this.SetDeviceErrorAsync(DeviceName, null);
        }
        
        /// <remarks/>
        public void SetDeviceErrorAsync(string DeviceName, object userState) {
            if ((this.SetDeviceErrorOperationCompleted == null)) {
                this.SetDeviceErrorOperationCompleted = new System.Threading.SendOrPostCallback(this.OnSetDeviceErrorOperationCompleted);
            }
            this.InvokeAsync("SetDeviceError", new object[] {
                        DeviceName}, this.SetDeviceErrorOperationCompleted, userState);
        }
        
        private void OnSetDeviceErrorOperationCompleted(object arg) {
            if ((this.SetDeviceErrorCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SetDeviceErrorCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void TestSaveCarInfoCompletedEventHandler(object sender, TestSaveCarInfoCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class TestSaveCarInfoCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal TestSaveCarInfoCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void SaveCarInfoCompletedEventHandler(object sender, SaveCarInfoCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class SaveCarInfoCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal SaveCarInfoCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void CarStatByDayCompletedEventHandler(object sender, CarStatByDayCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class CarStatByDayCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal CarStatByDayCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public System.Data.DataSet Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((System.Data.DataSet)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void CarLogByDayCompletedEventHandler(object sender, CarLogByDayCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class CarLogByDayCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal CarLogByDayCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public System.Data.DataSet Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((System.Data.DataSet)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void CarImageDeleteCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void FiveMinuteProcCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void GetWithOutInfoCompletedEventHandler(object sender, GetWithOutInfoCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetWithOutInfoCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetWithOutInfoCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public System.Data.DataTable Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((System.Data.DataTable)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.33440")]
    public delegate void SetDeviceErrorCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
}

#pragma warning restore 1591