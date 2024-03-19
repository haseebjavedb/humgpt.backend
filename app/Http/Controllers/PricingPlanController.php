<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PricingPlan;
use App\Models\PlanFeature;

class PricingPlanController extends Controller
{
    public function savePlan(Request $request){
        $request->validate([
            'plan_name' => 'required',
            'monthly_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'yearly_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'monthly_sale_per' => 'required|numeric',
            'yearly_sale_per' => 'required|numeric',
            'description' => 'required',
        ]);
        if($request->id){
            $plan = PricingPlan::find($request->id);
        }else{
            $plan = new PricingPlan();
        }
        $plan->plan_name = $request->plan_name;
        $plan->monthly_price = $request->monthly_price;
        $plan->yearly_price = $request->yearly_price;
        $plan->monthly_sale_per = $request->monthly_sale_per;
        $plan->yearly_sale_per = $request->yearly_sale_per;
        $plan->description = $request->description;
        $plan->final_monthly = ($plan->monthly_price - (($plan->monthly_price * $request->monthly_sale_per) / 100));
        $plan->final_yearly = ($plan->yearly_price - (($plan->yearly_price * $request->yearly_sale_per) / 100));
        $plan->save();
        
        $plans = PricingPlan::with('plan_features')->get();
        return response()->json(["plans" => $plans, "message" => "Plan saved successfully"], 200);
    }

    public function allPlans(Request $request){
        $plans = PricingPlan::with('plan_features')->get();
        return response()->json(["plans" => $plans], 200);
    }

    public function getPlan($id){
        $plan = PricingPlan::with('plan_features')->find($id);
        return response()->json(["plan" => $plan], 200);
    }

    public function deletePlan($id){
        PricingPlan::find($id)->delete();
        PlanFeature::where('pricing_plan_id', $id)->delete();
        $plans = PricingPlan::with('plan_features')->get();
        return response()->json(["plans" => $plans, "message" => "Plan removed successfully"], 200);
    }

    public function saveFeature(Request $request){
        $request->validate([
            'feature' => 'required',
        ]);
        if($request->id){
            $feature = PlanFeature::find($request->id);
        }else{
            $feature = new PlanFeature();
        }
        $feature->pricing_plan_id = $request->pricing_plan_id;
        $feature->feature = $request->feature;
        $feature->save();

        $features = PlanFeature::where('pricing_plan_id', $request->pricing_plan_id)->get();
        $plan = PricingPlan::with('plan_features')->find($request->pricing_plan_id);
        $plans = PricingPlan::with('plan_features')->get();
        return response()->json(["features" => $features, "plan" => $plan,"plans" => $plans, "message" => "Feature saved successfully"], 200);
    }

    public function deleteFeature($id){
        $feature = PlanFeature::find($id);
        $pricing_plan_id = $feature->id;
        $feature->delete();
        $features = PlanFeature::where('pricing_plan_id', $pricing_plan_id)->get();
        $plan = PricingPlan::with('plan_features')->find($pricing_plan_id);
        $plans = PricingPlan::with('plan_features')->get();
        return response()->json(["features" => $features, "plan" => $plan, "plans" => $plans, "message" => "Feature removed successfully"], 200);
    }
}
