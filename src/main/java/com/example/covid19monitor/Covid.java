package com.example.covid19monitor;

public class Covid {
    String deathCnt; // 사망자 수
    String defCnt; // 누적 확진자 수
    String gubun; // 시도명
    String gubunCn; // 시도명(한자)
    String gubunEn; // 시도명(영어)
    String incDec; // 전일대비 확진자 증감수
    String isolClearCnt; // 누적격리해제수
    String isolIngCnt; // 격리중환자수
    String localOccCnt; // 지역발생수
    String overFlowCnt; // 해외유입수
    String qurRate; // 10만명당발생율
    String stdDay; // 기준일자

    public String getDeathCnt() {
        return deathCnt;
    }

    public void setDeathCnt(String deathCnt) {
        this.deathCnt = deathCnt;
    }

    public String getDefCnt() {
        return defCnt;
    }

    public void setDefCnt(String defCnt) {
        this.defCnt = defCnt;
    }

    public String getGubun() {
        return gubun;
    }

    public void setGubun(String gubun) {
        this.gubun = gubun;
    }

    public String getGubunCn() {
        return gubunCn;
    }

    public void setGubunCn(String gubunCn) {
        this.gubunCn = gubunCn;
    }

    public String getGubunEn() {
        return gubunEn;
    }

    public void setGubunEn(String gubunEn) {
        this.gubunEn = gubunEn;
    }

    public String getIncDec() {
        return incDec;
    }

    public void setIncDec(String incDec) {
        this.incDec = incDec;
    }

    public String getIsolClearCnt() {
        return isolClearCnt;
    }

    public void setIsolClearCnt(String isolClearCnt) {
        this.isolClearCnt = isolClearCnt;
    }

    public String getIsolIngCnt() {
        return isolIngCnt;
    }

    public void setIsolIngCnt(String isolIngCnt) {
        this.isolIngCnt = isolIngCnt;
    }

    public String getLocalOccCnt() {
        return localOccCnt;
    }

    public void setLocalOccCnt(String localOccCnt) {
        this.localOccCnt = localOccCnt;
    }

    public String getOverFlowCnt() {
        return overFlowCnt;
    }

    public void setOverFlowCnt(String overFlowCnt) {
        this.overFlowCnt = overFlowCnt;
    }

    public String getQurRate() {
        return qurRate;
    }

    public void setQurRate(String qurRate) {
        this.qurRate = qurRate;
    }

    public String getStdDay() {
        return stdDay;
    }

    public void setStdDay(String stdDay) {
        this.stdDay = stdDay;
    }
}
