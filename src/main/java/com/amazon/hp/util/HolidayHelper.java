package com.amazon.hp.util;

import java.util.Calendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amazon.hp.util.dao.UtilDAO;


@Component("holidayHelper")
public class HolidayHelper{
    
    @Autowired UtilDAO utilDao;
    
    /**
     * 공휴일 여부
     * @param date
     */
    public boolean isHoliday(long date) {
        return isLegalHoliday(date) || isWeekend(date);
    }
    
    /*
     * 법정 공휴일 여부
     * */
    private boolean isLegalHoliday(long date){
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(date);

        int mYear = cal.get(Calendar.YEAR);
        int mMonth = cal.get(Calendar.MONTH);
        int mDay = cal.get(Calendar.DAY_OF_MONTH);
        String today = mYear + "" + mMonth + "" + mDay;
        
        boolean result = false;
        int count = utilDao.isValidHoliday(today);
        if(count > 0){
            result = true;
        }
        return result;
    }
    
    
    /**
     * 주말 (토,일)
     * @param date
     * @return
     */
    private static boolean isWeekend(long date) {
        boolean result = false;
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(date);
        
        //SUNDAY:1 SATURDAY:7
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY) {
            result = true;
        }
        
        return result;
    }
    
}