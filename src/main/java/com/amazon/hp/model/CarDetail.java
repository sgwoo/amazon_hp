package com.amazon.hp.model;

import java.util.List;
import java.util.Map;

public class CarDetail{

    private List<Map<String,Object>> priceMap;
    private Map<String,Object> mainMap;
    private Map<String,Object> estimateMap;
    private Map<String,Object> detailMap;
    
    public List<Map<String, Object>> getPriceMap() {
        return priceMap;
    }
    public void setPriceMap(List<Map<String, Object>> priceMap) {
        this.priceMap = priceMap;
    }
    public Map<String, Object> getEstimateMap() {
        return estimateMap;
    }
    public void setEstimateMap(Map<String, Object> estimateMap) {
        this.estimateMap = estimateMap;
    }
    public Map<String, Object> getDetailMap() {
        return detailMap;
    }
    public void setDetailMap(Map<String, Object> detailMap) {
        this.detailMap = detailMap;
    }
    public Map<String,Object> getMainMap() {
        return mainMap;
    }
    public void setMainMap(Map<String, Object> mainMap) {
        this.mainMap = mainMap;
    }
    
}